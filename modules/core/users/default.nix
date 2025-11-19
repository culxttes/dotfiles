{ config, username, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  users.users.${username} = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel"
    ];
    hashedPasswordFile = config.sops.secrets.hashedPassword.path;
  };
}
