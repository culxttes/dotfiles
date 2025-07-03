{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.tmux = {
      enable = true;

      historyLimit = 10000;
    };
  };
}
