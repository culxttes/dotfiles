{ lib, username, ... }:

{
  home-manager.users.${username} = {
    wayland.windowManager.hyprland = {
      settings = {
        monitor = lib.mkForce [
          "DP-1,1920x1080@60,-1920x0,1"
          "HDMI-A-1,1920x1080@60,0x0,1"
          "eDP-1,1920x1080@60,1920x0,1"
        ];

        device = [
          {
            name = "logitech-g-pro--1";
            sensitivity = "-0.7";
            accel_profile = "flat";
          }
        ];
      };
    };
  };
}
