{ hostName, ... }:

{
  sops.secrets."hashedPassword" = {
    sopsFile = ./passwordHash.yaml;
  };
}
