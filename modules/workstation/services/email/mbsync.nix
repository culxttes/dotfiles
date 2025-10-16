{ username, ... }:

{
  home-manager.users.${username} = {
    services.mbsync = {
      enable = true;
    };
  };
}
