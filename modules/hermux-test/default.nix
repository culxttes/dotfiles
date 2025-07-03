{
  hermux,
  pkgs,
  username,
  ...
}:

{
  /*
    nixpkgs.overlays = [
      hermux.overlays.default
    ];
  */

  home-manager.users.${username} = {
    home.packages = [
      hermux.packages.${pkgs.system}.hermux
    ];
  };
}
