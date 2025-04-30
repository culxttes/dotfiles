{ pkgs, username, ... }:

{
  home-manager.users.${username} = { home.packages = [ pkgs.wl-mirror ]; };
}
