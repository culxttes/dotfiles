{ pkgs, username, ... }:

{
  nixpkgs.overlays = [
    (import ./spotx.nix)
  ];

  environment.systemPackages = [
    pkgs.spotify
  ];
}
