{ config, username, ... }:
let
  home = config.users.users.${username}.home;
in
{
  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos-server"
    ];
  };

  sops.secrets."cloudflare/dns-api-token" = {
    sopsFile = ./secrets.yaml;
  };
  sops.secrets."vaultwarden/env" = {
    sopsFile = ./secrets.yaml;
  };
}
