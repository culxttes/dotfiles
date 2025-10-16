{ username, ... }:

{
  home-manager.users.${username} = {
    programs.msmtp = {
      enable = true;
    };
  };
}
