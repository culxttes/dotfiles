{ username, ... }:

{
  home-manager.users.${username} = {
    programs.notmuch = {
      enable = true;
    };
  };
}
