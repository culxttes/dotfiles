{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.custom.services.haproxy;
in
{
  options.custom.services.haproxy = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to enable HAProxy.
      '';
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.haproxy;
      description = "The HAProxy package to use";
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "haproxy";
      description = "User account under which haproxy runs.";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "haproxy";
      description = "Group account under which haproxy runs.";
    };

    extraConfig = lib.mkOption {
      type = lib.types.nullOr lib.types.lines;
      default = null;
      description = ''
        Contents of the HAProxy configuration file,
        {file}`haproxy.conf`.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.haproxy = {
      inherit (cfg)
        enable
        package
        user
        group
        ;

      config = cfg.extraConfig;
    };
  };
}
