{ hostName, ... }:

{
  networking = {
    hostName = hostName;
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        macAddress = "random";
      };
      ethernet = {
        macAddress = "50:33:51:46:3d:96";
      };
    };
  };
}
