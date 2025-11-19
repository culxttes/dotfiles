{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.callPackage ./gravitee-api-management.nix { }).all
  ];
}
