{ pkgs, username, ... }:
let
  claudeLauncher = pkgs.makeDesktopItem {
    name = "claude.ai";
    desktopName = "Claude.AI";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --user-data-dir=/home/${username}/.config/chromium-claude --app=https://claude.ai";
    icon = "${./assets/claude.svg}";
    comment = "Launch Claude.AI in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      claudeLauncher
    ];
  };
}
