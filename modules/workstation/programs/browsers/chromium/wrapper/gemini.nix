{ pkgs, username, ... }:
let
  geminiLauncher = pkgs.makeDesktopItem {
    name = "gemini";
    desktopName = "Gemini";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --user-data-dir=/home/${username}/.config/chromium-gemini --app=https://gemini.google.com";
    icon = "${./assets/gemini.svg}";
    comment = "Launch Gemini in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      geminiLauncher
    ];
  };
}
