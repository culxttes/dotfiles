{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    xdg.mimeApps = {
      defaultApplications = {
        "image/png" = "feh.desktop";
      };
    };

    home.packages = [
      pkgs.feh
    ];
  };
}
