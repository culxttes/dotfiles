{ username, ... }:

{
  home-manager.users.${username} = {
    programs.mbsync = {
      enable = true;
    };
  };
}
