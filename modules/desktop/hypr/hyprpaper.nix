{ username, ... }:

{
  home-manager.users.${username} = {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "${./assets/background.jpg}"
        ];
        wallpaper = [
          ",${./assets/background.jpg}"
        ];
        splash = false;
        ipc = "off";
      };
    };
  };
}
