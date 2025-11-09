{ pkgs, username, ... }:
let
  netflixLauncher = pkgs.makeDesktopItem {
    name = "netflix";
    desktopName = "Netflix";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --user-data-dir=/home/${username}/.config/chromium-netflix --app=https://www.netflix.com";
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
