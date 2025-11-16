{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  figmaLauncher = pkgs.makeDesktopItem {
    name = "figma";
    desktopName = "Figma";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-figma --app=https://figma.com";
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
