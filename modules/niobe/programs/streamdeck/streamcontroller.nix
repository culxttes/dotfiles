{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.streamcontroller
    ];

    systemd.user.services.streamcontroller = {
      Unit = {
        Description = "Stream Controller";
        After = [
          "graphical-session.target"
        ];
      };

      Service = {
        ExecStart = "${pkgs.streamcontroller}/bin/streamcontroller -b";
        Restart = "on-failure";
        RestartSec = 5;
      };

      Install = {
        WantedBy = [
          "graphical-session.target"
        ];
      };
    };
  };
}
