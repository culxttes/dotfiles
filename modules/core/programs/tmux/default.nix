{ username, ... }:

{
  home-manager.users.${username} = {
    programs.tmux = {
      enable = true;
    };
  };
}
