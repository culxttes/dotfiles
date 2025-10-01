{
  pkgs,
  username,
  hostName,
  ...
}:

{
  services.udev.packages = [
    pkgs.yubikey-personalization
  ];
  services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;

  home-manager.users.${username} = {
    home.packages = [
      pkgs.yubico-pam
      pkgs.yubikey-manager
    ];

    home.file.".config/Yubico/u2f_keys".source = ./assets/${hostName};
  };
}
