{ username, sops-nix, ... }:

{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  sops.secrets."language-tool/username" = {
    owner = username;
  };
  sops.secrets."language-tool/apiKey" = {
    owner = username;
  };
}
