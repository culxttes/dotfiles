{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  youtubeLauncher = pkgs.makeDesktopItem {
    name = "youtube";
    desktopName = "Youtube";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-youtube --app=https://www.youtube.com --incognito";
    icon = "${./assets/youtube.svg}";
    categories = [
      "Video"
      "AudioVideo"
    ];
    comment = "Launch Youtube in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      youtubeLauncher
    ];
  };
}
