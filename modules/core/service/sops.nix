{
  self,
  config,
  username,
  sops-nix,
  ...
}:
let
  home = config.users.users.${username}.home;
in
{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = "${self}/secrets/secrets.yaml";
  sops.defaultSopsFormat = "yaml";

  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos"
    ];
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
  sops.secrets."github/token/dotfiles-rw" = { };
}
