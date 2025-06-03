{ username, home-manager, ... }:
/*
  Declares and configures Home Manager as a NixOS module.
   - Imports the Home Manager module into the system configuration.
   - Enables global access to Nixpkgs and user-level packages.
   - Sets a custom file extension for Home Manager backups.
   - Initializes Home Manager for the given user, setting their username
     and home directory, and enables `home-manager` itself for managing
     the user environment declaratively.
*/
{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";

  home-manager.users.${username} = {
    programs.home-manager.enable = true;
    home.username = username;
    home.homeDirectory = "/home/${username}";
  };
}
