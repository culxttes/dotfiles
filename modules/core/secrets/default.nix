{
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

  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos"
    ];
  };

  sops.secrets."github/token/readonly" = { };
  sops.secrets."github/token/dotfiles-rw" = { };
}
