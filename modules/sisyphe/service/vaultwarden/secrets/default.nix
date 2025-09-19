{ ... }:

{
  sops.secrets."vaultwarden/env" = {
    sopsFile = ./secrets.yaml;
  };
}
