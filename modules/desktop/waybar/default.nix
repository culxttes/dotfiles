{ username, pkgs, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.pamixer
    ];

    programs.waybar = {
      enable = true;

      systemd.enable = true;

      settings = [
        {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 30;
          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [ ];
          modules-right = [
            "temperature"
            "pulseaudio"
            "pulseaudio#microphone"
            "network"
            "bluetooth"
            "backlight"
            "battery"
            "tray"
            "clock"
          ];

          "hyprland/window" = {
            format = "{}";
          };

          "hyprland/workspaces" = {
            format = "{}";
          };

          tray = {
            icon-size = 15;
            spacing = 10;
          };

          clock = {
            format = " {:%A %d %B %H:%M:%S}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          backlight = {
            device = "intel_backlight";
            format = "{icon} {percent}%";
            format-icons = [
              "󰃞"
              "󰃟"
              "󰃠"
            ];
            on-scroll-up = "brightnessctl set 1%+";
            on-scroll-down = "brightnessctl set 1%-";
            min-length = 5;
          };

          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 20;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };

          pulseaudio = {
            format = "{icon} {volume}%";
            tooltip = false;
            format-muted = " Muted";
            on-click = "pamixer -t";
            on-scroll-up = "pamixer -i 5";
            on-scroll-down = "pamixer -d 5";
            scroll-step = 5;
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
          };

          "pulseaudio#microphone" = {
            format = "{format_source}";
            format-source = "Mic: {volume}%";
            format-source-muted = "Mic: Muted";
            on-click = "pamixer --default-source -t";
            on-scroll-up = "pamixer --default-source -i 5";
            on-scroll-down = "pamixer --default-source -d 5";
            scroll-step = 5;
          };

          network = {
            format-wifi = "  {signalStrength}%";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{essid} - {ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}:{essid} {ipaddr}/{cidr}";
          };

          bluetooth = {
            format = " {status}";
            format-disabled = "";
            format-connected = " {num_connections}";
            tooltip-format = "{device_alias}";
            tooltip-format-connected = " {device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}";
          };
        }
      ];

      style = ''
        * {
          font-family: "Ubuntu Nerd Font";
          font-size: 1em;
          font-weight: bold;
          color: #FFFFFF;
        }

        window#waybar {
          background: rgba(0, 0, 0, 0);
        }

        tooltip {
          background: #1e1e2e;
          transition: 0.3s;
        }

        #workspaces button:hover {
          background: initial;
          color: #F0F0F0;
        }

        #window,
        #clock,
        #battery,
        #pulseaudio,
        #network,
        #bluetooth,
        #temperature,
        #workspaces,
        #tray,
        #backlight {
          opacity: 0.8;
          padding: 0px 10px;
          margin: 0;
          margin-top: 5px;
        }

        #window {
          border-radius: 20px;
          margin-left: 5px;
          margin-right: 5px;
        }
      '';
    };
  };
}
