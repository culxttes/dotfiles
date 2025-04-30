{ pkgs, username, ... }:

{
  home-manager.users.${username} = { programs.ssh = { enable = true; }; };
}
