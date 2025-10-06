{ config, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://pass.sagbot.com";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
      SMTP_HOST = "127.0.0.1";
      SMTP_PORT = 25;
      SMTP_SSL = false;
      SMTP_FROM = "vaultwarden@sagbot.com";
      SMTP_FROM_NAME = "Vaultwerden server";
    };
    environmentFile = config.sops.secrets."vaultwarden/env".path;
  };
}
