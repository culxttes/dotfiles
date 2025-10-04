{ pkgs, ... }:

{
  virtualisation.waydroid.enable = true;

  systemd.tmpfiles.rules = [
    "C /var/lib/waydroid/waydroid_base.prop 0644 root root - ${./assets/waydroid_base.prop}"
  ];

  environment.systemPackages = [
    pkgs.wl-clipboard
  ];

  networking.firewall = {
    allowedTCPPorts = [
      53
    ];
    allowedUDPPorts = [
      53
      67
    ];
  };
}
