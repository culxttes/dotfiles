{ pkgs, username, ... }:
let
  chatgptLauncher = pkgs.makeDesktopItem {
    name = "chatgpt";
    desktopName = "ChatGPT";
    exec = "${pkgs.google-chrome}/bin/google-chrome-stable --user-data-dir=/home/${username}/.config/chromium-chatgpt --app=https://chatgpt.com";
    icon = "${./assets/chatgpt.svg}";
    comment = "Launch ChatGPT in standalone window";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      chatgptLauncher
    ];
  };
}
