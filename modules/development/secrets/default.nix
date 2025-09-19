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
}
