{ hostName, ... }:

{
  networking = {
    hostName = hostName;
    enableIPv6 = true;
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
        macAddress = "random";
      };
      ethernet = {
        macAddress = "random";
      };
    };
  };
}
