{ pkgs, ... }:

{
  plugins = [
    (pkgs.callPackage ./tailcloakify.nix { })
  ];
}
