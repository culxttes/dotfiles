{ pkgs, username, ... }:
/*
  yubioath-flutter, a graphical application for managing TOTP and HOTP
  credentials on YubiKeys. It provides a simple interface to generate and view
  time-based one-time passwords (2FA codes) stored on the device.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.yubioath-flutter
    ];
  };
}
