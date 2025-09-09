{ pkgs, ... }:

{
  users.users.atacc = {
    isSystemUser = true;
    group = "atacc";
    home = "/opt/atacc";
  };

  users.groups.atacc = { };

  systemd.services.atacc = {
    description = "ATACC";
    after = [ "network.target" ];
    confinement.packages = with pkgs; [
      nodejs_20
    ];

    serviceConfig = {
      User = "atacc";
      Group = "atacc";
      WorkingDirectory = "/opt/atacc/api/v1";
      ExecStart = "${pkgs.nodejs_20}/bin/node app/api.js";
      Restart = "always";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
