{
  pkgs,
  noctalia,
  username,
  ...
}:

{
  home-manager.users.${username} = {
    imports = [
      # keep-sorted start
      noctalia.homeModules.default
      # keep-sorted end
    ];

    programs.noctalia-shell = {
      enable = true;

      package = noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      systemd.enable = true;

      settings = {
        settingsVersion = 6;
        bar = {
          position = "top";
          backgroundOpacity = 0;
          monitors = [ ];
          density = "default";
          showCapsule = true;
          floating = true;
          marginVertical = 0.25;
          marginHorizontal = 0.25;
          widgets = {
            left = [
              {
                id = "ControlCenter";
              }
              {
                id = "SystemMonitor";
              }
              {
                id = "ActiveWindow";
              }
              {
                id = "MediaMini";
              }
            ];
            center = [
              {
                id = "Workspace";
              }
            ];
            right = [
              {
                id = "Tray";
              }
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "Battery";
              }
              {
                id = "Microphone";
              }
              {
                id = "Volume";
              }
              {
                id = "Brightness";
              }
              {
                id = "Clock";
              }
              {
                id = "NotificationHistory";
              }
            ];
          };
        };
        general = {
          avatarImage = ./assets/logo.jpg;
          dimDesktop = true;
          showScreenCorners = false;
          forceBlackScreenCorners = false;
          radiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 1;
        };
        location = {
          name = "Rouen";
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
        };
        screenRecorder = {
          directory = "~/Videos";
          frameRate = 60;
          audioCodec = "opus";
          videoCodec = "h264";
          quality = "very_high";
          colorRange = "limited";
          showCursor = true;
          audioSource = "default_output";
          videoSource = "portal";
        };
        wallpaper = {
          enabled = false;

          directory = null;
          enableMultiMonitorDirectories = false;
          setWallpaperOnAllMonitors = true;
          fillMode = "crop";
          fillColor = "#000000";
          randomEnabled = false;
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = "random";
          transitionEdgeSmoothness = 5.0e-2;
          monitors = [ ];
        };
        appLauncher = {
          enableClipboardHistory = true;
          position = "center";
          backgroundOpacity = 1;
          pinnedExecs = [ ];
          useApp2Unit = false;
          sortByMostUsed = true;
        };
        dock = {
          enabled = false;
          autoHide = false;
          exclusive = false;
          backgroundOpacity = 1;
          floatingRatio = 1;
          monitors = [ ];
          pinnedApps = [ ];
        };
        network = {
          wifiEnabled = true;
          bluetoothEnabled = true;
        };
        notifications = {
          doNotDisturb = false;
          monitors = [ ];
          location = "top_right";
          alwaysOnTop = false;
          lastSeenTs = 0;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          enableOSD = true;
        };
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          cavaFrameRate = 60;
          visualizerType = "linear";
          mprisBlacklist = [ ];
          preferredPlayer = "";
        };
        ui = {
          fontDefault = "Roboto";
          fontFixed = "DejaVu Sans Mono";
          fontBillboard = "Inter";
          monitorsScaling = [ ];
          idleInhibitorEnabled = false;
        };
        brightness = {
          brightnessStep = 5;
        };
        colorSchemes = {
          useWallpaperColors = false;
          predefinedScheme = null;
          darkMode = true;
        };
        matugen = {
          gtk4 = false;
          gtk3 = false;
          qt6 = false;
          qt5 = false;
          kitty = false;
          ghostty = false;
          foot = false;
          fuzzel = false;
          vesktop = false;
          pywalfox = false;
          enableUserTemplates = false;
        };
        nightLight = {
          enabled = false;

          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };
        hooks = {
          enabled = false;

          wallpaperChange = "";
          darkModeChange = "";
        };
      };

      colors = {
        mOutline = "#C0C0C0";

        mPrimary = "#FFFFFF";
        mSecondary = "#C0C0C0";
        mTertiary = "#FFFFFF";

        mOnPrimary = "#000000";
        mOnSecondary = "#000000";
        mOnTertiary = "#000000";

        mError = "#DDDDDD";

        mOnError = "#C0C0C0";

        mShadow = "#000000";
        mSurface = "#000000";
        mSurfaceVariant = "#000000";

        mOnSurface = "#FFFFFF";
        mOnSurfaceVariant = "#C0C0C0";
      };
    };
  };
}
