{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    xdg.mimeApps = {
      defaultApplications = {
        "video/mp4" = "mpv.desktop";
      };
    };

    home.packages = [
      pkgs.mpv
    ];
  };
}
