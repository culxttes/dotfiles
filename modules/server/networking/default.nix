{
  imports = [
    # keep-sorted start
    ./wireguard
    # keep-sorted end
  ];

  networking.firewall.allowPing = false;
}
