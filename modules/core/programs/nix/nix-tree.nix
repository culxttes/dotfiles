{ username, pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.nix-tree
    ];
  };
}
