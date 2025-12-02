{ config, ... }:

{
  sops.secrets = {
    "gravitee/postgresql/password" = {
      sopsFile = ./pgpassword;
      format = "binary";

      owner = config.custom.services.gravitee.user;
    };
  };
}
