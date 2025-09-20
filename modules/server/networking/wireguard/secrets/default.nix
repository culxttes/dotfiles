{ hostName, ... }:

{
  sops.secrets."wireguard/privateKey" = {
    sopsFile = ./${hostName}.yaml;
  };
}
