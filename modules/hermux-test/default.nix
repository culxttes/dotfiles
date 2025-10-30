{ config, hermux, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    hermux.nixosModules.hermux
    # keep-sorted end
  ];

  services.hermux = {
    enable = true;

    listen = {
      address = "127.0.0.33";
      port = 3333;
    };

    tokens = config.sops.secrets."hermux/tokens".path;
    allow = config.sops.secrets."hermux/allow".path;
  };
}
