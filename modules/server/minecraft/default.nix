{ pkgs, ... }:

{
  users.users.minecraft2 = {
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
