{
  config,
  hostName,
  username,
  groups,
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

  sops.defaultSopsFormat = "yaml";

  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos-core"
      "${home}/.ssh/nixos-${hostName}"
    ]
    ++ (map (group: "${home}/.ssh/nixos-${group}") groups);
  };
}
