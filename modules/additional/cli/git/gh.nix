{ pkgs, username, ... }:

{
  home-manager.users.${username} = { programs.gh = { enable = true; }; };
}
