{ config, hostName, ... }:
let
  wireconf = import ./assets/users/${hostName}.nix;

  nameWithoutExt =
    path: builtins.head (builtins.match "(.*)\\.nix" (builtins.baseNameOf (toString path)));

  genInterfaces =
    files:
    builtins.listToAttrs (
      builtins.map (
        file:
        let
          conf = import file;
          name = nameWithoutExt file;
        in
        {
          name = "wg-${name}";
          value = {
            autostart = false;

            address = [
              "${conf.address.ipv6}${wireconf.suffix}/128"
              "${conf.address.ipv4}${wireconf.suffix}/32"
            ];

            privateKeyFile = config.sops.secrets."wireguard/privateKey".path;
            peers = [
              {
                publicKey = conf.publicKey;
                allowedIPs = [
                  "::/0"
                  "0.0.0.0/0"
                ];
                endpoint = "${name}.sagbot.com:51820";
              }
            ];
          };
        }
      ) files
    );
in
{
  networking.wg-quick.interfaces = genInterfaces [
    # keep-sorted start
    ./assets/servers/icare.nix
    ./assets/servers/sisyphe.nix
    # keep-sorted end
  ];
}
