{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.jetbrains.idea-community-bin
    ];
  };
}
