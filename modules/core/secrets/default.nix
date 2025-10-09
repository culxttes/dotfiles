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
    # keep-sorted start
    sops-nix.nixosModules.sops
    # keep-sorted end
  ];

  # , sops -a "$(cat key.pub | , ssh-to-age)" file.toml

  sops.defaultSopsFormat = "yaml";

  sops.age = {
    sshKeyPaths = [
      "${home}/.ssh/nixos-core"
      "${home}/.ssh/nixos-${hostName}"
    ]
    ++ (map (group: "${home}/.ssh/nixos-${group}") groups);
  };
}
