{ username, sops-nix, ... }:

{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  # nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/nixos > ~/.config/sops/age/keys.txt
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  sops.secrets."language-tool/username" = {
    owner = username;
  };
  sops.secrets."language-tool/api-key" = {
    owner = username;
  };

  sops.secrets."cloudflare/dns-api-token" = { };

  sops.secrets."vaultwarden/admin-token" = { };
}
