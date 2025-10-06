{ ... }:

{
  sops.secrets."cloudflare/dns-api-token" = {
    sopsFile = ./secrets.yaml;
  };
}
