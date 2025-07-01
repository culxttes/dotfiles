{ pkgs, ... }:

{
  users.users.minecraft = {
    isNormalUser = true;
    packages = with pkgs; [
      curl
      openjdk17
      udev
      screen
    ];
  };

  networking.firewall.allowedTCPPorts = [
    25565
  ];
}
