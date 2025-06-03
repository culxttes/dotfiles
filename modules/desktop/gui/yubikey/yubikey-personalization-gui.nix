{ pkgs, username, ... }:
/*
  yubikey-personalization-gui, a graphical application for configuring
  YubiKeys. It allows setting up features like one-time passwords (OTP),
  static passwords, and challenge-response, providing an easy-to-use interface
  for personalizing YubiKey devices.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.yubikey-personalization-gui
    ];
  };
}
