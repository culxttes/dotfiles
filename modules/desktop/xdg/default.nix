{ username, ... }:

{
  imports = [
    ./mime.nix
    ./userDirs.nix
  ];

  home-manager.users.${username}.xdg = {
    enable = true;
  };
}
