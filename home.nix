{ config, pkgs, inputs, ... }:
let
  screenshot_sh = pkgs.writeShellScriptBin "screenshot" ''
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy
  '';
  hgcc_sh = pkgs.writeShellScriptBin "hgcc" ''
    ${pkgs.gcc}/bin/gcc -std=c23 -Wall -Wconversion -Werror -Wextra -Wpedantic -Wwrite-strings -O2 -o "$(dirname $1)/$(basename $1 .c)" $1
  '';
  noi_sh = pkgs.writeShellScriptBin "noi" ''
    ${./bin/noi.AppImage}
  '';
in 
{
  imports = [ 
    inputs.hyprpanel.homeManagerModules.hyprpanel 
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "culottes";
  home.homeDirectory = "/home/culottes";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you 
  # do want to update the value, then make sure to first check the 
  # Home Manager release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Term
    pkgs.oh-my-posh
    pkgs.zoxide
    pkgs.yazi

    # Graphical Application
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    pkgs.vesktop
    pkgs.galculator
    ((pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
      src = (builtins.fetchTarball {
        url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
        sha256 = "14h2jmlb8qb9bkmcxza5w74kys8092cm8dzrnxm3s67gh063hnr0";
      });
      version = "latest";
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
    }))
    pkgs.jetbrains.idea-community-bin

    # CLI Tools
    pkgs.pamixer
    pkgs.pavucontrol
    pkgs.playerctl
    pkgs.unzip
    pkgs.gzip
    pkgs.brightnessctl
    pkgs.imagemagick
    pkgs.ffmpeg
    pkgs.ripgrep
    pkgs.wl-clipboard
    pkgs.slurp
    pkgs.grim
    pkgs.nix-index
    pkgs.yubico-pam
    pkgs.yubikey-manager
    pkgs.jq
    pkgs.fastfetch

    hgcc_sh
    screenshot_sh
    noi_sh

    # Tools
    pkgs.networkmanagerapplet
    pkgs.networkmanager_dmenu 

    # Javascript Engine
    pkgs.deno
    pkgs.nodejs

    # C
    pkgs.gcc
    pkgs.gnumake
    pkgs.uncrustify

    # Rust
    pkgs.rustup

    # Latex
    pkgs.tex-fmt
    (
      pkgs.texlive.withPackages (ps: [ 
        ps.latexmk 
      ])
    )

    # Scala
    pkgs.scala
    pkgs.sbt

    # Java
    pkgs.jdk17
  ];

  gtk.iconTheme = {
    name = "Paper";
    package = pkgs.paper-icon-theme;
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family          = "JetBrainsMono Nerd Font";
      window_padding_width = 4;
      background           = "#fafafa";
      foreground           = "#5b6673";
      cursor               = "#ff69ff";
      selection_background = "#f0ede4";
      color0               = "#000000";
      color8               = "#323232";
      color1               = "#ff0000";
      color9               = "#ff6565";
      color2               = "#86b200";
      color10              = "#b8e532";
      color3               = "#ff7f00";
      color11              = "#ffc800";
      color4               = "#41a6d9";
      color12              = "#73d7ff";
      color5               = "#ff00ff";
      color13              = "#ffa3ff";
      color6               = "#4cbe99";
      color14              = "#7ff0cb";
      color7               = "#ffffff";
      color15              = "#ffffff";
      selection_foreground = "#fafafa";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
       ssh = "kitten ssh";
       icat = "kitten icat";
       clipboard = "kitten clipboard";
    };
    initExtra = ''
      eval "$(zoxide init --cmd cd zsh)"

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };

  programs.oh-my-posh = {
    enable = true;
    settings = {
      console_title_template = "{{ .Shell }} in {{ .Folder }}";
      final_space = true;
      version = 3;
      blocks = [
        {
          alignment = "left";
          newline = true;
          type = "prompt";
          segments = [
            {
              background = "transparent";
              foreground = "blue";
              style = "plain";
              template = "{{ .Path }}";
              type = "path";
              properties = {
                style = "full";
              };
            }
            {
              background = "transparent";
              foreground = "green";
              style = "plain";
              template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
              type = "git";
              properties = {
                branch_icon = "";
                commit_icon = "@";
                fetch_status = true;
              };
            }
          ];
        }
        {
          overflow = "hidden";
          type = "rprompt";
          segments = [
            {
              background = "transparent";
              foreground = "yellow";
              style = "plain";
              template = "{{ .FormattedMs }}";
              type = "executiontime";
              properties = {
                threshold = 5000;
              };
            }
          ];
        }
        {
          alignment = "left";
          newline = true;
          type = "prompt";
          segments = [
            {
              background = "transparent";
              foreground_templates = [
                "{{if gt .Code 0}}red{{end}}"
                "{{if eq .Code 0}}magenta{{end}}"
              ];
              style = "plain";
              template = "❯";
              type = "text";
            }
          ];
        }
      ];
      secondary_prompt = {
        background = "transparent";
        foreground = "magenta";
        template = "❯❯ ";
      };
      transient_prompt = {
        background = "transparent";
        foreground_templates = [
          "{{if gt .Code 0}}red{{end}}"
          "{{if eq .Code 0}}magenta{{end}}"
        ];
        template = "❯ ";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Lurgrid";
    userEmail = "lurgrid@sagbot.com";
    extraConfig = {
      commit = {
        gpgSign = true;
      };
    };
  };

  programs.gpg = {
    enable = true;
    scdaemonSettings = {
      disable-ccid = true;
    };
    settings = {
      use-agent = true;
    };
  };

  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    extraConfig = {
      modi = "drun,run,filebrowser,window";
      case-sensitive = false;
      cycle = true;
      filter = "";
      scroll-method = 0;
      normalize-match = true;
      show-icons = true;
      icon-theme = "Papirus";
      steal-focus = false;

      matching = "normal";
      tokenize = true;

      ssh-client = "ssh";
      ssh-command = "{terminal} -e {ssh-client} {host} [-p {port}]";
      parse-hosts = true;
      parse-known-hosts = true;

      drun-categories = "";
      drun-match-fields = "name,generic,exec,categories,keywords";
      drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      drun-show-actions = false;
      drun-url-launcher = "xdg-open";
      drun-use-desktop-cache = false;
      drun-reload-desktop-cache = false;

      run-command = "{cmd}";
      run-list-command = "";
      run-shell-command = "{terminal} -e {cmd}";

      window-match-fields = "title,class,role,name,desktop";
      window-command = "wmctrl -i -R {window}";
      window-format = "{w} - {c} - {t:0}";
      window-thumbnail = false;

      disable-history = false;
      sorting-method = "normal";
      max-history-size = 25;

      display-window = "Windows";
      display-windowcd = "Window CD";
      display-run = "Run";
      display-ssh = "SSH";
      display-drun = "Apps";
      display-combi = "Combi";
      display-keys = "Keys";
      display-filebrowser = "Files";

      terminal = "rofi-sensible-terminal";
      font = "Mono 12";
      sort = false;
      threads = 0;
      click-to-exit = true;
    };
    theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in 
    {
      "*" = {
        font =                                  "JetBrains Mono Nerd Font 10";
        background =                  mkLiteral "#101010";
        background-alt =              mkLiteral "#252525";
        foreground =                  mkLiteral "#FFFFFF";
        selected =                    mkLiteral "#505050";
        active =                      mkLiteral "#909090";
        urgent =                      mkLiteral "#707070";
      };

      window = {
        transparency =                          "real";
        location =                    mkLiteral "center";
        anchor =                      mkLiteral "center";
        fullscreen =                            false;
        width =                       mkLiteral "1000px";
        x-offset =                    mkLiteral "0px";
        y-offset =                    mkLiteral "0px";

        enabled =                               true;
        border-radius =               mkLiteral "15px";
        cursor =                                "default";
        background-color =            mkLiteral "@background";
      };

      mainbox = {
        enabled =                               true;
        spacing =                     mkLiteral "0px";
        background-color =            mkLiteral "transparent";
        orientation =                 mkLiteral "horizontal";
        children =                              [ "imagebox" "listbox" ];
      };

      imagebox = {
        padding =                     mkLiteral "20px";
        background-color =            mkLiteral "transparent";
        background-image =            mkLiteral "url(\"${builtins.toString ./image/rofi.jpg}\", height)";
        orientation =                 mkLiteral "vertical";
        children =                              [ "inputbar" "dummy" "mode-switcher" ];
      };

      listbox = {
        spacing =                     mkLiteral "20px";
        padding =                     mkLiteral "20px";
        background-color =            mkLiteral "transparent";
        orientation =                 mkLiteral "vertical";
        children =                              [ "message" "listview" ];
      };

      dummy = {
        background-color =            mkLiteral "transparent";
      };

      inputbar = {
        enabled =                               true;
        spacing =                     mkLiteral "10px";
        padding =                     mkLiteral "15px";
        border-radius =               mkLiteral "10px";
        background-color =            mkLiteral "@background-alt";
        text-color =                  mkLiteral "@foreground";
        children =                              [ "textbox-prompt-colon" "entry" ];
      };
      textbox-prompt-colon = {
        enabled =                               true;
        expand =                                false;
        str =                                   "";
        background-color =            mkLiteral "inherit";
        text-color =                  mkLiteral "inherit";
      };
      entry = {
        enabled =                               true;
        background-color =            mkLiteral "inherit";
        text-color =                  mkLiteral "inherit";
        cursor =                      mkLiteral "text";
        placeholder =                           "Search";
        placeholder-color =           mkLiteral "inherit";
      };

      mode-switcher = {
        enabled =                               true;
        spacing =                     mkLiteral "20px";
        background-color =            mkLiteral "transparent";
        text-color =                  mkLiteral "@foreground";
      };
      button = {
        padding =                     mkLiteral "15px";
        border-radius =               mkLiteral "10px";
        background-color =            mkLiteral "@background-alt";
        text-color =                  mkLiteral "inherit";
        cursor =                      mkLiteral "pointer";
      };
      "button selected" = {
        background-color =            mkLiteral "@selected";
        text-color =                  mkLiteral "@foreground";
      };

      listview = {
        enabled =                               true;
        columns =                               1;
        lines =                                 8;
        cycle =                                 true;
        dynamic =                               true;
        scrollbar =                             false;
        layout =                      mkLiteral "vertical";
        reverse =                               false;
        fixed-height =                          true;
        fixed-columns =                         true;

        spacing =                     mkLiteral "10px";
        background-color =            mkLiteral "transparent";
        text-color =                  mkLiteral "@foreground";
        cursor =                                "default";
      };

      element = {
        enabled =                               true;
        spacing =                     mkLiteral "15px";
        padding =                     mkLiteral "8px";
        border-radius =               mkLiteral "10px";
        background-color =            mkLiteral "transparent";
        text-color =                  mkLiteral "@foreground";
        cursor =                      mkLiteral "pointer";
      };
      "element normal.normal" = {
        background-color =            mkLiteral "inherit";
        text-color =                  mkLiteral "inherit";
      };
      "element normal.urgent" = {
        background-color =            mkLiteral "@urgent";
        text-color =                  mkLiteral "@foreground";
      };
      "element normal.active" = {
        background-color =            mkLiteral "@active";
        text-color =                  mkLiteral "@foreground";
      };
      "element selected.normal" = {
        background-color =            mkLiteral "@selected";
        text-color =                  mkLiteral "@foreground";
      };
      "element selected.urgent" = {
        background-color =            mkLiteral "@urgent";
        text-color =                  mkLiteral "@foreground";
      };
      "element selected.active" = {
        background-color =            mkLiteral "@urgent";
        text-color =                  mkLiteral "@foreground";
      };
      element-icon = {
        background-color =            mkLiteral "transparent";
        text-color =                  mkLiteral "inherit";
        size =                        mkLiteral "32px";
        cursor =                      mkLiteral "inherit";
      };
      element-text = {
        background-color =            mkLiteral "transparent";
        text-color =                  mkLiteral "inherit";
        cursor =                      mkLiteral "inherit";
        vertical-align =              mkLiteral "0.5";
        horizontal-align =            mkLiteral "0.0";
      };

      message = {
        background-color =            mkLiteral "transparent";
      };
      textbox = {
        padding =                     mkLiteral "15px";
        border-radius =               mkLiteral "10px";
        background-color =            mkLiteral "@background-alt";
        text-color =                  mkLiteral "@foreground";
        vertical-align =              mkLiteral "0.5";
        horizontal-align =            mkLiteral "0.0";
      };
      error-message = {
        padding =                     mkLiteral "15px";
        border-radius =               mkLiteral "20px";
        background-color =            mkLiteral "@background";
        text-color =                  mkLiteral "@foreground";
      };
    };
  };

  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      window-title-home-tilde = true;
      statusbar-home-tilde = true;
      page-padding = 1;

      font = "Open Sans normal 16";
      window-height = 1024;
      window-width = 768;
      adjust-open = "best-fit";
      synctex = true;
      synctex-editor-command = "nvim --headless -c \"VimtexInverseSearch %{line}:%{column} '%{input}'\"";
      dbus-service = true;
      database = "sqlite";

      scroll-page-aware = true;
      scroll-full-overlap = 0.01;
      scroll-step = 50;
      incremental-search = true;
      guioptions = "";

      recolor = false;
      recolor-keephue = true;

      notification-error-bg       = "#282828";
      notification-error-fg       = "#fb4934";
      notification-warning-bg     = "#282828";
      notification-warning-fg     = "#fabd2f";
      notification-bg             = "#282828";
      notification-fg             = "#b8bb26";

      completion-bg               = "#504945";
      completion-fg               = "#ebdbb2";
      completion-group-bg         = "#3c3836";
      completion-group-fg         = "#928374";
      completion-highlight-bg     = "#83a598";
      completion-highlight-fg     = "#504945";

      index-bg                    = "#504945";
      index-fg                    = "#ebdbb2";
      index-active-bg             = "#83a598";
      index-active-fg             = "#504945";

      inputbar-bg                 = "#282828";
      inputbar-fg                 = "#ebdbb2";

      statusbar-bg                = "#504945";
      statusbar-fg                = "#ebdbb2";

      highlight-color             = "rgba(250,189,47,0.5)";
      highlight-active-color      = "rgba(254,128,25,0.5)";

      default-bg                  = "rgba(40,40,40,0.7)";
      default-fg                  = "#ebdbb2";
      render-loading              = true;
      render-loading-bg           = "#282828";
      render-loading-fg           = "#ebdbb2";
      recolor-lightcolor          = "rgba(40,40,40,0.0)";
      recolor-darkcolor           = "#d4be98";
    };
    mappings = {
      "r" = "reload";
      "R" = "rotate";

      "i" = "recolor";
      "p" = "print";

      "K" = "zoom in";
      "J" = "zoom out";

      "b" = "toggle_statusbar";

      "[normal] ZZ" = "quit";
      "[normal] ZQ" = "quit";
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentitiesOnly yes
      IdentityAgent none
    '';
  };

  xdg.configFile = {
    nvim = {
      source = ./nvim;
    };
  };

  services.ssh-agent = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 60 * 60 * 6;
    defaultCacheTtlSsh = 60 * 60 * 6;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        (builtins.toString ./image/background.jpg)
      ];
      wallpaper = [
        ",${builtins.toString ./image/background.jpg}"
      ];
      splash = false;
      ipc = "off";
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 3600;
          on-timeout = "loginctl lock-session";
          on-resume = "notify-send \"Welcome back!\"";
        }
        {
          timeout = 3630;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = (builtins.toString ./image/background.jpg);
        blur_passes = "2";
        contrast = "1";
        brightness = "0.7";
        vibrancy = "0.2";
        vibrancy_darkness = "0.2";
      };
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };
      input-field = {
        size = "250, 60";
        outline_thickness = 2;
        dots_size = "0.2";
        dots_spacing = "0.35";
        dots_center = true;
        outer_color = "rgba(205, 214, 244, 0.2)";
        inner_color = "rgba(0, 0, 0, 0.2)";
        font_color = "$foreground";
        fade_on_empty = false;
        rounding = "-1";
        check_color = "rgb(204, 136, 34)";
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };
      label = [
        {
          text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

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
          weather = {
            location = "Rouen";
            unit = "metric";
            key = "b4c81a17a95641278d8171935242507";
          };
        };
        dashboard = { 
          powermenu.avatar.image = toString ./image/logo.jpg;
          shortcuts.left = {
            shortcut1 = {
              icon = "";
              command = "firefox-nightly";
              tooltip = "Firefox";
            };
            shortcut2.command = "spotify";
            shortcut3.command = "vesktop";
          };
        };
        power.lowBatteryNotification = true;
      };
      bar = {
        notifications = {
          show_total = true;
          hideCountWhenZero = true;
        };
        launcher.icon = "";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    
    settings = {  
      # Environement Variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        # hyprpanel
        # hyprpaper
        # hypridle
      ];

      # Monitors
      monitor = [
        ",preferred,auto,1"
      ];

      # Programs
      "$terminal" = "kitty";
      "$fileManager" = "yazi";
      "$menu" = "rofi -show drun";
      
      # Look and feel

      general = {
        gaps_in = 5;
        gaps_out = 5;

        border_size = 2;

        "col.active_border" = "rgba(363656ee)";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = "1.0";
        inactive_opacity = "1.0";

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = false;
          size = 5;
          passes = 1;

          vibrancy = "0.1696";
	      };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # Inputs

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };

        numlock_by_default = true;
      };

      gestures = {
         workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      windowrulev2 = "suppressevent maximize, class:.*";

      "$mod" = "SUPER";

      bind = [
        # Screenshot
        ", Print, exec, ${screenshot_sh}/bin/screenshot"

        # Special keys
        ", xf86monbrightnessup, exec, brightnessctl set 10%+"
        ", xf86monbrightnessdown, exec, brightnessctl set 10%-"
        ", xf86audioraisevolume, exec, pamixer -i 5"
        ", xf86audiolowervolume, exec, pamixer -d 5"
        ", xf86audiomute, exec, pamixer -t"
        ", xf86calculator, exec, galculator"

        # Default bind
        "$mod, Return, exec, $terminal"
        "$mod SHIFT, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, $fileManager"
        "$mod, Space, togglefloating"
        "$mod, D, exec, $menu"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"

        # Move focus with mod + arrow keys
        "$mod SHIFT, left, movefocus, l"
        "$mod SHIFT, right, movefocus, r"
        "$mod SHIFT, up, movefocus, u"
        "$mod SHIFT, down, movefocus, d"

        # Move window with mod + shift + arrow keys
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        # Resize window with mod + alt + arrow keys
        "$mod ALT, left, resizeactive, -10 0"
        "$mod ALT, right, resizeactive, 10 0"
        "$mod ALT, up, resizeactive, 0 -10"
        "$mod ALT, down, resizeactive, 0 10"

        # Toggle fullscreen
        "$mod, F, fullscreen"

        # Switch workspaces with mod + [0-9]
        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, minus, workspace, 6"
        "$mod, egrace, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccdeilla, workspace, 9"
        "$mod, agrave, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, ampersand, movetoworkspace, 1"
        "$mod SHIFT, eacute, movetoworkspace, 2"
        "$mod SHIFT, quotedbl, movetoworkspace, 3"
        "$mod SHIFT, apostrophe, movetoworkspace, 4"
        "$mod SHIFT, parenleft, movetoworkspace, 5"
        "$mod SHIFT, minus, movetoworkspace, 6"
        "$mod SHIFT, egrace, movetoworkspace, 7"
        "$mod SHIFT, underscore, movetoworkspace, 8"
        "$mod SHIFT, ccdeilla, movetoworkspace, 9"
        "$mod SHIFT, agrave, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
      ];

      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to 
  # manage plain files is through 'home.file'.
  home.file = {
    ".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

    ".config/networkmanager-dmenu/config.ini" = {
      text = ''
        [dmenu]
        dmenu_command = ${pkgs.rofi-wayland}/bin/rofi -show drun -password
        active_chars = ✅
        compact = True
        wifi_chars = ▂▄▆█
      '';
    };

    ".uncrustify072_c.cfg" = {
      text = ''
        # Uncrustify-0.72.0_f

        #
        # General options
        #

        input_tab_size                  = 2
        output_tab_size                 = 2
        sp_do_brace_open                = force
        sp_brace_close_while            = force
        sp_while_paren_open             = force

        #
        # Spacing options
        #

        sp_arith                        = force
        sp_assign                       = force
        sp_assign_default               = force
        sp_enum_assign                  = force
        sp_pp_concat                    = force
        sp_bool                         = force
        sp_compare                      = force
        sp_inside_paren                 = remove
        sp_paren_paren                  = remove
        sp_cparen_oparen                = remove
        sp_brace_brace                  = force
        sp_before_ptr_star              = force
        sp_between_ptr_star             = remove
        sp_after_ptr_star               = remove
        sp_after_ptr_star_qualifier     = force
        sp_after_ptr_star_func          = remove
        sp_ptr_star_paren               = remove
        sp_before_ptr_star_func         = force
        sp_before_byref                 = force
        sp_after_byref                  = remove
        sp_after_byref_func             = remove
        sp_before_byref_func            = remove
        sp_before_sparen                = force
        sp_inside_sparen                = remove
        sp_after_sparen                 = force
        sp_sparen_brace                 = force
        sp_after_semi                   = force
        sp_after_semi_for_empty         = remove
        sp_before_square                = remove
        sp_before_squares               = remove
        sp_inside_square                = remove
        sp_after_comma                  = force
        sp_after_operator_sym           = remove
        sp_after_cast                   = force
        sp_inside_paren_cast            = remove
        sp_sizeof_paren                 = remove
        sp_inside_braces_enum           = force
        sp_inside_braces_struct         = force
        sp_inside_braces_empty          = remove
        sp_type_func                    = force
        sp_func_proto_paren             = remove
        sp_func_proto_paren_empty       = remove
        sp_func_type_paren              = remove
        sp_func_def_paren               = remove
        sp_inside_fparens               = remove
        sp_inside_fparen                = remove
        sp_inside_tparen                = remove
        sp_after_tparen_close           = remove
        sp_fparen_brace                 = force
        sp_func_call_paren              = remove
        sp_return_paren                 = force
        sp_defined_paren                = remove
        sp_macro_func                   = add
        sp_else_brace                   = force
        sp_brace_else                   = force
        sp_brace_typedef                = force
        sp_after_oc_scope               = remove
        sp_cond_colon                   = force
        sp_cond_question                = force
        sp_case_label                   = force
        # sp_before_tr_emb_cmt            = add
        sp_before_tr_cmt                = add
        # sp_num_before_tr_emb_cmt        = 1
        sp_num_before_tr_cmt            = 1

        #
        # Indenting options
        #

        indent_columns                  = 2
        indent_continue                 = 4
        indent_with_tabs                = 0
        indent_func_call_param          = true
        indent_func_def_param           = true
        indent_func_param_double        = true
        indent_relative_single_line_comments = true
        indent_switch_case              = 2
        indent_case_brace               = 2
        indent_col1_comment             = true
        indent_single_after_return      = true

        #
        # Newline adding and removing options
        #

        nl_start_of_file                = force
        nl_end_of_file                  = force
        nl_end_of_file_min              = 1
        nl_assign_brace                 = remove
        nl_enum_brace                   = remove
        nl_struct_brace                 = remove
        nl_union_brace                  = remove
        nl_if_brace                     = remove
        nl_brace_else                   = remove
        nl_else_brace                   = remove
        nl_else_if                      = remove
        nl_for_brace                    = remove
        nl_while_brace                  = remove
        nl_do_brace                     = remove
        nl_brace_while                  = remove
        nl_switch_brace                 = remove
        nl_after_case                   = true
        nl_case_colon_brace             = force
        nl_func_type_name               = remove
        nl_func_proto_type_name         = remove
        nl_func_paren                   = remove
        nl_func_def_paren               = remove
        nl_func_decl_end                = remove
        nl_func_def_end                 = remove
        nl_func_decl_empty              = remove
        nl_func_def_empty               = remove
        nl_fdef_brace                   = remove
        nl_after_semicolon              = true
        nl_after_brace_open             = true
        nl_brace_struct_var             = remove

        #
        # Blank line options
        #

        nl_max                          = 2
        nl_max_blank_in_func            = 1
        nl_after_func_body              = 2
        nl_after_multiline_comment      = true
        nl_after_label_colon            = true

        #
        # 0: No change (default).
        #

        eat_blanks_after_open_brace     = true
        eat_blanks_before_close_brace   = true

        #
        # Positioning options
        #

        pos_arith                       = lead
        pos_assign                      = lead
        pos_bool                        = lead
        pos_compare                     = lead
        pos_conditional                 = lead
        pos_comma                       = trail

        #
        # Line splitting options
        #

        code_width                      = 80

        #
        # Code alignment options (not left column spaces/tabs)
        #

        #
        # Comment modification options
        #

        cmt_width                       = 80
        cmt_reflow_mode                 = 2
        cmt_convert_tab_to_spaces       = true
        cmt_c_group                     = true
        cmt_star_cont                   = true

        #
        # Applies to cmt_insert_func_header.
        #

        #
        # Code modifying options (non-whitespace)
        #

        mod_full_brace_do               = force
        mod_full_brace_for              = force
        mod_full_brace_if               = force
        mod_full_brace_while            = force
        mod_paren_on_return             = remove
        mod_remove_extra_semicolon      = true
        mod_move_case_break             = true
        mod_remove_empty_return         = true

        #
        # Preprocessor options
        #

        pp_indent                       = remove
        # pp_space                        = remove
        pp_space_after                  = remove
      '';
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/culottes/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WLR_DRM_NO_ATOMIC = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
