{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  chatgptLauncher = pkgs.makeDesktopItem {
    name = "chatgpt";
    desktopName = "ChatGPT";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-chatgpt --app=https://chatgpt.com";
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
