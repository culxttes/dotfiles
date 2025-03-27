{ username, hyprpanel, ... }:

{
  nixpkgs.overlays = [ hyprpanel.overlay ];

  home-manager.users.${username} = {
    imports = [ 
      hyprpanel.homeManagerModules.hyprpanel 
    ];

    programs.hyprpanel = {
      enable = true;
      hyprland.enable = true;
      overwrite.enable = true;

      theme = "monochrome";

      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
              "hypridle"
            ];
            middle = [
              "media"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "systray"
              "clock"
              "notifications"
            ];
          };
          "1" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "volume"
              "clock"
              "notifications"
            ];
          };
          "2" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
            ];
            right = [
              "volume"
              "clock"
              "notifications"
            ];
          };
        };
      };

      settings = {
        scalingPriority = "hyprland";
        terminal = "kitty";
        theme = {
          font.size = "1.0rem";
          bar = {
            transparent = true;
            shadowMargins = "0px 0px 0px 0px";
          };
        };
        menus = {
          clock = {
            time.military = true;
            weather.enabled = false;
          };
          dashboard = {
            directories.enabled = false;
            shortcuts.enabled = false;
            powermenu.avatar.image = toString ./assets/logo.jpg;
          };
          power.lowBatteryNotification = true;
        };
        bar = {
          workspaces = {
            showApplicationIcons = true;
            showWsIcons = true;
          };
          notifications = {
            show_total = true;
            hideCountWhenZero = true;
          };
          launcher.icon = "";
        };
      };
    };
  };
}
