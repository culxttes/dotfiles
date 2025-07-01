{ config, username, ... }:
let
  home = config.users.users.${username}.home;
in
{
  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos-development"
    ];
  };

  sops.secrets."language-tool/username" = {
    sopsFile = ./secrets.yaml;
    owner = username;
  };
  sops.secrets."language-tool/api-key" = {
    sopsFile = ./secrets.yaml;
    owner = username;
  };
}
