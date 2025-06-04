{
  config,
  username,
  sops-nix,
  ...
}:

{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age = {
    sshKeyPaths = [
      "${config.users.users.${username}.home}/.ssh/nixos"
    ];
    keyFile = "${config.users.users.${username}.home}/.config/sops/age/keys.txt";
    generateKey = true;
  };

  sops.secrets."language-tool/username" = {
    owner = username;
  };
  sops.secrets."language-tool/api-key" = {
    owner = username;
  };

  sops.secrets."cloudflare/dns-api-token" = { };

  sops.secrets."vaultwarden/admin-token" = { };

  sops.secrets."github/token/readonly" = { };
}
