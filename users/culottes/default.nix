{ username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
    ];
  };
}
