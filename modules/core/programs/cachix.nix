{ pkgs, username, ... }:
/*
  cachix, a command-line tool for interacting with the Cachix binary caches
  service. It allows pushing and pulling pre-built Nix packages to/from remote
  caches, which speeds up builds and enables sharing artifacts across systems
  or teams.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.cachix
    ];
  };
}
