{ pkgs, config, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.keycloak = {
    enable = true;

    inherit (pkgs.callPackage ./plugins { }) plugins;

    initialAdminPassword = "password";

    database.passwordFile = config.sops.secrets."keycloak/passwordDB".path;

    settings = {
      hostname = "https://auth.sagbot.com";
      http-host = "127.0.0.38";
      http-port = 38080;
      http-enabled = true;
      https-enabled = false;
      proxy-headers = "xforwarded";

      health-enabled = true;

      log-console-level = "debug";
    };
  };

  systemd.services.keycloak.environment = {
    TAILCLOAKIFY_HEADER_LOGO_URL = "https://sagbot.com/sagbot_banner.png";
    TAILCLOAKIFY_FAVICON_URL = "https://sagbot.com/uwulock.png";
  };
}
