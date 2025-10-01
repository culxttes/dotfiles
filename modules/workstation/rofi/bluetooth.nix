{ pkgs, username, ... }:
let
  rofi-bluetooth = pkgs.makeDesktopItem {
    name = "rofi-bluetooth";
    desktopName = "Rofi Bluetooth";
    exec = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";
    icon = "${./assets/bluetooth.svg}";
  };
in
{
  home-manager.users.${username} = {
    home.packages = [
      rofi-bluetooth
    ];
  };
}
