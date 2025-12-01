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

        Type = "notify";

        ExecStartPre =
          let
            preStartScript = pkgs.writeShellScript "gravitee-prestart" ''
              mkdir -p /run/gravitee/{config,lib,licence,logs,metrics,plugins}

              for file in ${cfg.package}/share/gravitee/plugins/*; do
                ln -sf "$file" /run/gravitee/plugins/
              done

              for file in ${cfg.package}/share/gravitee/lib/*; do
                ln -sf "$file" /run/gravitee/lib/
              done

              ln -sf ${graviteeConfig} /run/gravitee/config/gravitee.yml
            '';
          in
          "${preStartScript}";
        ExecStart = lib.getExe cfg.package;
        Restart = "always";
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
