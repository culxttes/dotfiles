{ home-manager, username, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "hm-backup";
      home-manager.users.${username} = {
        programs.home-manager.enable = true;
        home.username = username;
        home.homeDirectory = "/home/${username}";

        home.sessionVariables = {
          NIXOS_OZONE_WL = "1";
          WLR_DRM_NO_ATOMIC = "1";
        };
      };
    }
  ];
}
