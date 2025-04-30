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
      ethernet = { macAddress = "random"; };
    };
  };
}
