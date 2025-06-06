{ pkgs, username, ... }:
/*
  Ledger Live Desktop, the official desktop application for managing Ledger
  hardware wallets. It allows users to install apps, manage crypto assets, and
  perform transactions securely with Ledger devices.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.ledger-live-desktop
    ];
  };

  services.udev.extraRules = ''
    # HW.1, Nano
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c|2b7c|3b7c|4b7c", TAG+="uaccess", TAG+="udev-acl"

    # Blue, NanoS, Aramis, HW.2, Nano X, NanoSP, Stax, Ledger Test,
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", TAG+="uaccess", TAG+="udev-acl"

    # Same, but with hidraw-based library (instead of libusb)
    KERNEL=="hidraw*", ATTRS{idVendor}=="2c97", MODE="0666"
  '';

  users.users.${username}.extraGroups = [
    "plugdev"
  ];
}
