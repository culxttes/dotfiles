{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.mermaid-cli
      pkgs.presenterm
    ];
  };
}
