{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  geminiLauncher = pkgs.makeDesktopItem {
    name = "gemini";
    desktopName = "Gemini";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-gemini --app=https://gemini.google.com";
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
