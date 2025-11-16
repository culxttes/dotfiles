{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  netflixLauncher = pkgs.makeDesktopItem {
    name = "netflix";
    desktopName = "Netflix";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-netflix --app=https://www.netflix.com";
    icon = "${./assets/netflix.png}";
    categories = [
      "Video"
      "AudioVideo"
    ];
    comment = "Launch Netflix in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      netflixLauncher
    ];
  };
}
