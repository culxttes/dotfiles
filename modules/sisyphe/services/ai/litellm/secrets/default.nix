{ config, ... }:

{
  sops.secrets = {
    "litellm/environement" = {
      sopsFile = ./environement;
      format = "binary";

      owner = config.systemd.services.litellm.serviceConfig.User;
    };
  };
}
