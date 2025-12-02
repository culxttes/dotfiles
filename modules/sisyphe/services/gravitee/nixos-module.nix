{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.custom.services.gravitee;

  graviteeConfig = pkgs.writeText "gravitee-config.yaml" (lib.generators.toYAML { } cfg.settings);
in
{
  options.custom.services.gravitee = {
    enable = lib.mkEnableOption "Gravitee API Management (APIM)";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.callPackage ./packages { };
      description = "The Gravitee package to use";
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "gravitee";
      description = "User account under which gravitee runs.";
    };

    plugins = {
      jdbc = lib.mkOption {
        type = lib.types.listOf lib.types.path;
        default = [ ];
        description = "Path to database driver to use JDBC";
      };
    };

    environmentFiles = lib.mkOption {
      type = lib.types.listOf lib.types.path;
      default = [ ];
      description = ''
        List of environment files set in the gravitee systemd service.
        For example passwords should be set in one of these files.
      '';
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "gravitee";
      description = "Group account under which gravitee runs.";
    };

    settings = lib.mkOption {
      type = lib.types.anything;
      default = { };
      description = "Gravitee configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.gravitee = {
      description = "Gravitee";

      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      environment = {
        GRAVITEE_HOME = "/run/gravitee/";
      };

      serviceConfig = {
        User = cfg.user;
        Group = cfg.group;

        Type = "simple";

        EnvironmentFile = cfg.environmentFiles;

        ExecStartPre =
          let
            runDir = "/run/gravitee";

            jdbcPluginCommands = lib.concatMapStringsSep "\n" (
              plugin: "ln -sf '${plugin}' '${runDir}/plugins/ext/repository-jdbc/'"
            ) cfg.plugins.jdbc;

            preStartScript = pkgs.writeShellScript "gravitee-prestart" ''
              set -euo pipefail

              mkdir -p "${runDir}"/{config,lib,licence,logs,metrics,plugins/ext/repository-jdbc}

              for file in "${cfg.package}/share/gravitee/plugins"/*; do
                if [ -f "$file" ]; then
                  ln -sf "$file" "${runDir}/plugins/"
                fi
              done

              for file in "${cfg.package}/share/gravitee/lib"/*; do
                ln -sf "$file" "${runDir}/lib/"
              done

              echo "ALTER USER gravitee WITH PASSWORD '$PGPASSWORD';" | ${pkgs.postgresql}/bin/psql

              ln -sf "${graviteeConfig}" "${runDir}/config/gravitee.yml"

              ${jdbcPluginCommands}
            '';
          in
          "${preStartScript}";
        ExecStart = lib.getExe cfg.package;
        # Restart = "always";
        RuntimeDirectory = "gravitee";

        NoNewPrivileges = true;
        ProtectHome = true;
        ProtectSystem = "strict";
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
      };
    };

    users.users = lib.optionalAttrs (cfg.user == "gravitee") {
      gravitee = {
        inherit (cfg) group;
        isSystemUser = true;
      };
    };

    users.groups = lib.optionalAttrs (cfg.group == "gravitee") {
      gravitee = { };
    };
  };
}
