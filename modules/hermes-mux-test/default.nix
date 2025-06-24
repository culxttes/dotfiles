{
  hermes-mux,
  pkgs,
  username,
  ...
}:

{
  /*
    nixpkgs.overlays = [
      hermes-mux.overlays.default
    ];
  */

  home-manager.users.${username} = {
    home.packages = [
      hermes-mux.packages.${pkgs.system}.hermes-mux
    ];
  };
}
