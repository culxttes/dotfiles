{ username, ... }:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
    ];
  };
}
