{ username, ... }:

{
  imports = [
    # keep-sorted start
    ./mime.nix
    ./userDirs.nix
    # keep-sorted end
  ];

  home-manager.users.${username}.xdg = {
    enable = true;
  };
}
