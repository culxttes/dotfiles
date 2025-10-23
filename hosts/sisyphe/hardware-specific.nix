{
  boot.swraid = {
    enable = true;
    mdadmConf = ''
      ARRAY /dev/md0 metadata=1.2 UUID=940fbd14:461cea16:c1c25c6f:67a97efc
      ARRAY /dev/md1 metadata=1.2 UUID=ada8290d:e8e0a062:33381635:1ab2b4fe
      MAILADDR mdadm-error@sagbot.com
    '';
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    defaultGateway = {
      address = "54.37.86.254";
      interface = "enp6s0";
    };
    defaultGateway6 = {
      address = "2001:41d0:0303:4eff:00ff:00ff:00ff:00ff";
      interface = "enp6s0";
    };

    interfaces.enp6s0 = {
      ipv6 = {
        addresses = [
          {
            address = "2001:41d0:303:4ea4::";
            prefixLength = 64;
          }
        ];
      };

      ipv4 = {
        addresses = [
          {
            address = "54.37.86.164";
            prefixLength = 24;
          }
        ];
      };
    };
  };
}
