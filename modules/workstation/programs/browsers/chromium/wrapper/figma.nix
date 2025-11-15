{ pkgs, username, ... }:
let
  figmaLauncher = pkgs.makeDesktopItem {
    name = "figma";
    desktopName = "Figma";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --user-data-dir=/home/${username}/.config/chromium-figma --app=https://figma.com";
    icon = "${./assets/figma.svg}";
    comment = "Launch Figma in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      figmaLauncher
    ];
  };
}
