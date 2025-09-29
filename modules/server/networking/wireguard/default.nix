{
  pkgs,
  config,
  hostName,
  ...
}:
let
  wireconf = import ./assets/${hostName}.nix;
in
{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  networking = {
    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = wireconf.publicNetworkInterface;
      internalInterfaces = [ "wg0" ];
    };

    firewall.allowedUDPPorts = [
      config.networking.wg-quick.interfaces.wg0.listenPort
    ];

    wg-quick.interfaces = {
      wg0 = {
        address = [
          (wireconf.address.ipv6 + "1/64")
          (wireconf.address.ipv4 + "1/32")
        ];

        listenPort = 51820;

        privateKeyFile = config.sops.secrets."wireguard/privateKey".path;

        postUp = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${wireconf.address.ipv4}1/24 -o ${wireconf.publicNetworkInterface} -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -s ${wireconf.address.ipv6}1/64 -o ${wireconf.publicNetworkInterface} -j MASQUERADE
        '';

        preDown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${wireconf.address.ipv4}1/24 -o ${wireconf.publicNetworkInterface} -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -s ${wireconf.address.ipv6}1/64 -o ${wireconf.publicNetworkInterface} -j MASQUERADE
        '';

        peers = [
          {
            publicKey = "eG11wyEjN2ptw14A6JESnv0CSTcA6QCT3L4gnr0Tbk4=";
            allowedIPs = [
              (wireconf.address.ipv6 + "2/128")
              (wireconf.address.ipv4 + "2/32")
            ];
          }
        ];
      };
    };
  };
}
