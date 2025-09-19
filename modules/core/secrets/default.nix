{
  config,
  systemInfo,
  hostName,
  username,
  sops-nix,
  ...
}:
let
  home = config.users.users.${username}.home;
  groups = systemInfo.${hostName}.groups;
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
