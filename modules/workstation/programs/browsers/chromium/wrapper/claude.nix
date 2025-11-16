{
  config,
  pkgs,
  username,
  ...
}:
let
  inherit (config.home-manager.users.${username}.xdg) configHome;

  claudeLauncher = pkgs.makeDesktopItem {
    name = "claude.ai";
    desktopName = "Claude.AI";
    exec = "${pkgs.brave}/bin/brave --user-data-dir=${configHome}/chromium-claude --app=https://claude.ai";
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
