{
  pkgs,
  config,
  username,
  ...
}:
let
  youtubeLauncher = pkgs.makeDesktopItem {
    name = "youtube";
    desktopName = "YouTube";
    exec = "${
      config.home-manager.users.${username}.programs.firefox.package
    }/bin/firefox-nightly -P youtube --no-remote --new-window https://www.youtube.com";
    icon = "${./assets/youtube.png}";
    categories = [
      "Video"
      "AudioVideo"
    ];
    comment = "Launch Youtube in standalone window";
  };
in
{
  home-manager.users.${username} = {
    programs.firefox.profiles.youtube = {
      id = 1;
      isDefault = false;
      containersForce = true;

      settings = config.home-manager.users.${username}.programs.firefox.profiles.default.settings // {
        "browser.privatebrowsing.autostart" = false;
      };

      extensions = config.home-manager.users.${username}.programs.firefox.profiles.default.extensions;
    };

    home.packages = [
      youtubeLauncher
    ];
  };
}
