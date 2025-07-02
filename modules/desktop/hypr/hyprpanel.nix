{ username, ... }:
/*
  Hyprpanel, a customizable Wayland panel built specifically for Hyprland. It
  provides a status bar that can display workspaces, system info  (like CPU,
  RAM, battery), notifications, and more.
*/
{
  home-manager.users.${username} = {
    programs.hyprpanel = {
      enable = true;

      settings = {
        scalingPriority = "hyprland";
        terminal = "kitty";

        theme = {
          bar = {
            background = "#000000";
            border = {
              color = "#FFFFFF";
            };
            buttons = {
              background = "#1A1A1A";
              battery = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#ffffff";
                text = "#FFFFFF";
              };
              bluetooth = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#89dbeb";
                text = "#FFFFFF";
              };
              borderColor = "#FFFFFF";
              clock = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#FFFFFF";
                text = "#FFFFFF";
              };
              dashboard = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
              };
              hover = "#333333";
              icon = "#FFFFFF";
              icon_background = "#090909";
              media = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#FFFFFF";
                text = "#FFFFFF";
              };
              modules = {
                cava = {
                  background = "#090909";
                  border = "#FFFFFF";
                  icon = "#FFFFFF";
                  icon_background = "#090909";
                  text = "#FFFFFF";
                };
                cpu = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                hypridle = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                hyprsunset = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                kbLayout = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                microphone = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#090909";
                  text = "#ffffff";
                };
                netstat = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                power = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                };
                ram = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                storage = {
                  background = "#090909";
                  border = "#ffffff";
                  icon = "#ffffff";
                  icon_background = "#ffffff";
                  text = "#ffffff";
                };
                submap = {
                  background = "#090909";
                  border = "#FFFFFF";
                  icon = "#FFFFFF";
                  icon_background = "#090909";
                  text = "#FFFFFF";
                };
                updates = {
                  background = "#090909";
                  border = "#FFFFFF";
                  icon = "#FFFFFF";
                  icon_background = "#FFFFFF";
                  text = "#FFFFFF";
                };
                weather = {
                  background = "#090909";
                  border = "#FFFFFF";
                  icon = "#FFFFFF";
                  icon_background = "#FFFFFF";
                  text = "#FFFFFF";
                };
                worldclock = {
                  background = "#090909";
                  border = "#FFFFFF";
                  icon = "#FFFFFF";
                  icon_background = "#FFFFFF";
                  text = "#FFFFFF";
                };
              };
              network = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#caa6f7";
                text = "#FFFFFF";
              };
              notifications = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#FFFFFF";
                total = "#FFFFFF";
              };
              style = "default";
              systray = {
                background = "#090909";
                border = "#444444";
                customIcon = "#FFFFFF";
              };
              text = "#FFFFFF";
              volume = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#ffffff";
                text = "#FFFFFF";
              };
              windowtitle = {
                background = "#090909";
                border = "#FFFFFF";
                icon = "#FFFFFF";
                icon_background = "#FFFFFF";
                text = "#FFFFFF";
              };
              workspaces = {
                active = "#FFFFFF";
                available = "#FFFFFF";
                background = "#090909";
                border = "#FFFFFF";
                hover = "#444444";
                numbered_active_highlighted_text_color = "#21252b";
                numbered_active_underline_color = "#ffffff";
                occupied = "#FFFFFF";
              };
            };
            menus = {
              background = "#000000";
              border = {
                color = "#333333";
              };
              buttons = {
                active = "#FFFFFF";
                default = "#FFFFFF";
                disabled = "#CCCCCC";
                text = "#000000";
              };
              cards = "#111111";
              check_radio_button = {
                active = "#ffffff";
                background = "#000000";
              };
              dimtext = "#CCCCCC";
              dropdownmenu = {
                background = "#000000";
                divider = "#111111";
                text = "#FFFFFF";
              };
              feinttext = "#444444";
              iconbuttons = {
                active = "#FFFFFF";
                passive = "#FFFFFF";
              };
              icons = {
                active = "#FFFFFF";
                passive = "#CCCCCC";
              };
              label = "#FFFFFF";
              listitems = {
                active = "#FFFFFF";
                passive = "#FFFFFF";
              };
              menu = {
                battery = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#333333";
                  };
                  card = {
                    color = "#111111";
                  };
                  icons = {
                    active = "#ffffff";
                    passive = "#9a9996";
                  };
                  label = {
                    color = "#ffffff";
                  };
                  listitems = {
                    active = "#ffffff";
                    passive = "#9a9996";
                  };
                  slider = {
                    background = "#5e5c64";
                    backgroundhover = "#5e5c64";
                    primary = "#cccccc";
                    puck = "#5e5c64";
                  };
                  text = "#CCCCCC";
                };
                bluetooth = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#444444";
                  };
                  card = {
                    color = "#111111";
                  };
                  iconbutton = {
                    active = "#ffffff";
                    passive = "#9a9996";
                  };
                  icons = {
                    active = "#ffffff";
                    passive = "#77767b";
                  };
                  label = {
                    color = "#FFFFFF";
                  };
                  listitems = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  scroller = {
                    color = "#ffffff";
                  };
                  status = "#CCCCCC";
                  switch = {
                    disabled = "#444444";
                    enabled = "#FFFFFF";
                    puck = "#9a9996";
                  };
                  switch_divider = "#444444";
                  text = "#FFFFFF";
                };
                clock = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#333333";
                  };
                  calendar = {
                    contextdays = "#333333";
                    currentday = "#FFFFFF";
                    days = "#CCCCCC";
                    paginator = "#FFFFFF";
                    weekdays = "#FFFFFF";
                    yearmonth = "#ffffff";
                  };
                  card = {
                    color = "#1A1A1A";
                  };
                  text = "#CCCCCC";
                  time = {
                    time = "#FFFFFF";
                    timeperiod = "#ffffff";
                  };
                  weather = {
                    hourly = {
                      icon = "#FFFFFF";
                      temperature = "#FFFFFF";
                      time = "#FFFFFF";
                    };
                    icon = "#FFFFFF";
                    stats = "#FFFFFF";
                    status = "#FFFFFF";
                    temperature = "#CCCCCC";
                    thermometer = {
                      cold = "#ffffff";
                      extremelycold = "#ffffff";
                      extremelyhot = "#ffffff";
                      hot = "#ffffff";
                      moderate = "#FFFFFF";
                    };
                  };
                };
                dashboard = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#333333";
                  };
                  card = {
                    color = "#1A1A1A";
                  };
                  controls = {
                    bluetooth = {
                      background = "#ffffff";
                      text = "#000000";
                    };
                    disabled = "#333333";
                    input = {
                      background = "#FFFFFF";
                      text = "#000000";
                    };
                    notifications = {
                      background = "#ffffff";
                      text = "#000000";
                    };
                    volume = {
                      background = "#ffffff";
                      text = "#000000";
                    };
                    wifi = {
                      background = "#FFFFFF";
                      text = "#000000";
                    };
                  };
                  directories = {
                    left = {
                      bottom = {
                        color = "#ffffff";
                      };
                      middle = {
                        color = "#ffffff";
                      };
                      top = {
                        color = "#FFFFFF";
                      };
                    };
                    right = {
                      bottom = {
                        color = "#FFFFFF";
                      };
                      middle = {
                        color = "#FFFFFF";
                      };
                      top = {
                        color = "#FFFFFF";
                      };
                    };
                  };
                  monitors = {
                    bar_background = "#333333";
                    cpu = {
                      bar = "#ffffff";
                      icon = "#ffffff";
                      label = "#ffffff";
                    };
                    disk = {
                      bar = "#FFFFFF";
                      icon = "#FFFFFF";
                      label = "#FFFFFF";
                    };
                    gpu = {
                      bar = "#ffffff";
                      icon = "#ffffff";
                      label = "#ffffff";
                    };
                    ram = {
                      bar = "#ffffff";
                      icon = "#ffffff";
                      label = "#ffffff";
                    };
                  };
                  powermenu = {
                    confirmation = {
                      background = "#000000";
                      body = "#CCCCCC";
                      border = "#333333";
                      button_text = "#000000";
                      card = "#1A1A1A";
                      confirm = "#ffffff";
                      deny = "#ffffff";
                      label = "#FFFFFF";
                    };
                    logout = "#ffffff";
                    restart = "#ffffff";
                    shutdown = "#ffffff";
                    sleep = "#ffffff";
                  };
                  profile = {
                    name = "#FFFFFF";
                  };
                  shortcuts = {
                    background = "#FFFFFF";
                    recording = "#5CFF5C";
                    text = "#000000";
                  };
                };
                media = {
                  album = "#FFFFFF";
                  artist = "#FFFFFF";
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#444444";
                  };
                  buttons = {
                    background = "#FFFFFF";
                    enabled = "#FFFFFF";
                    inactive = "#5e5c64";
                    text = "#000000";
                  };
                  card = {
                    color = "#1A1A1A";
                  };
                  slider = {
                    background = "#77767b";
                    backgroundhover = "#444444";
                    primary = "#FFFFFF";
                    puck = "#CCCCCC";
                  };
                  song = "#FFFFFF";
                  timestamp = "#FFFFFF";
                };
                network = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#444444";
                  };
                  card = {
                    color = "#111111";
                  };
                  iconbuttons = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  icons = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  label = {
                    color = "#FFFFFF";
                  };
                  listitems = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  scroller = {
                    color = "#FFFFFF";
                  };
                  status = {
                    color = "#CCCCCC";
                  };
                  switch = {
                    disabled = "#444444";
                    enabled = "#FFFFFF";
                    puck = "#333333";
                  };
                  text = "#FFFFFF";
                };
                notifications = {
                  background = "#000000";
                  border = "#333333";
                  card = "#1A1A1A";
                  clear = "#ffffff";
                  label = "#FFFFFF";
                  no_notifications_label = "#333333";
                  pager = {
                    background = "#000000";
                    button = "#FFFFFF";
                    label = "#9a9996";
                  };
                  scrollbar = {
                    color = "#FFFFFF";
                  };
                  switch = {
                    disabled = "#333333";
                    enabled = "#FFFFFF";
                    puck = "#333333";
                  };
                  switch_divider = "#333333";
                };
                power = {
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#333333";
                  };
                  buttons = {
                    logout = {
                      background = "#1A1A1A";
                      icon = "#000000";
                      icon_background = "#ffffff";
                      text = "#ffffff";
                    };
                    restart = {
                      background = "#1A1A1A";
                      icon = "#000000";
                      icon_background = "#ffffff";
                      text = "#ffffff";
                    };
                    shutdown = {
                      background = "#1A1A1A";
                      icon = "#000000";
                      icon_background = "#FFFFFF";
                      text = "#ffffff";
                    };
                    sleep = {
                      background = "#1A1A1A";
                      icon = "#000000";
                      icon_background = "#ffffff";
                      text = "#ffffff";
                    };
                  };
                };
                systray = {
                  dropdownmenu = {
                    background = "#000000";
                    divider = "#1A1A1A";
                    text = "#CCCCCC";
                  };
                };
                volume = {
                  audio_slider = {
                    background = "#77767b";
                    backgroundhover = "#444444";
                    primary = "#FFFFFF";
                    puck = "#CCCCCC";
                  };
                  background = {
                    color = "#000000";
                  };
                  border = {
                    color = "#444444";
                  };
                  card = {
                    color = "#1A1A1A";
                  };
                  iconbutton = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  icons = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  input_slider = {
                    background = "#77767b";
                    backgroundhover = "#444444";
                    primary = "#FFFFFF";
                    puck = "#CCCCCC";
                  };
                  label = {
                    color = "#FFFFFF";
                  };
                  listitems = {
                    active = "#FFFFFF";
                    passive = "#77767b";
                  };
                  text = "#CCCCCC";
                };
              };
              popover = {
                background = "#000000";
                border = "#000000";
                text = "#FFFFFF";
              };
              progressbar = {
                background = "#444444";
                foreground = "#FFFFFF";
              };
              slider = {
                background = "#CCCCCC";
                backgroundhover = "#444444";
                primary = "#FFFFFF";
                puck = "#CCCCCC";
              };
              switch = {
                disabled = "#444444";
                enabled = "#FFFFFF";
                puck = "#CCCCCC";
              };
              text = "#CCCCCC";
              tooltip = {
                background = "#000000";
                text = "#FFFFFF";
              };
            };
            shadowMargins = "0px 0px 0px 0px";
            transparent = true;
          };
          font = {
            size = "1.0rem";
          };
          notification = {
            actions = {
              background = "#FFFFFF";
              text = "#000000";
            };
            background = "#1a1a1a";
            border = "#444444";
            close_button = {
              background = "#FFFFFF";
              label = "#000000";
            };
            label = "#FFFFFF";
            labelicon = "#FFFFFF";
            text = "#FFFFFF";
            time = "#CCCCCC";
          };
          osd = {
            bar_color = "#FFFFFF";
            bar_container = "#000000";
            bar_empty_color = "#444444";
            bar_overflow_color = "#FFFFFF";
            icon = "#000000";
            icon_container = "#FFFFFF";
            label = "#FFFFFF";
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
            powermenu.avatar.image = "${./assets/logo.jpg}";
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
          layouts = {
            "0" = {
              left = [
                "dashboard"
                "workspaces"
                "windowtitle"
                "hypridle"
              ];
              middle = [ "media" ];
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
              middle = [ "media" ];
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
              middle = [ "media" ];
              right = [
                "volume"
                "clock"
                "notifications"
              ];
            };
          };
        };
      };
    };
  };
}
