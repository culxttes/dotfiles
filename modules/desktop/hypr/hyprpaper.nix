{ username, ... }:

{
  home-manager.users.${username} = {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ (builtins.toString ./assets/background.jpg) ];
        wallpaper = [ ",${builtins.toString ./assets/background.jpg}" ];
        splash = false;
        ipc = "off";
      };
    };
  };
}
