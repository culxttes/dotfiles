{ pkgs, ... }:

{
  boot.swraid = {
    enable = true;
    mdadmConf = ''
      ARRAY /dev/md0 metadata=1.2 UUID=940fbd14:461cea16:c1c25c6f:67a97efc
      ARRAY /dev/md1 metadata=1.2 UUID=ada8290d:e8e0a062:33381635:1ab2b4fe
      MAILADDR mdadm-error@sagbot.com
    '';
  };

  networking.interfaces.enp6s0.ipv6 = {
    routes = [
      {
        address = "::";
        via = "2001:41d0:0303:4eff:00ff:00ff:00ff:00ff";
        prefixLength = 0;
      }
    ];
    addresses = [
      {
        address = "2001:41d0:303:4ea4::";
        prefixLength = 64;
      }
    ];
  };
}
