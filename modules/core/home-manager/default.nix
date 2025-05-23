{ username, home-manager, ... }:

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
