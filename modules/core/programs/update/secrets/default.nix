{ username, ... }:

{
  sops.secrets."github/token/readwrite" = {
    sopsFile = ./secrets.yaml;
    owner = username;
  };
}
