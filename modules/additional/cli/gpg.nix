{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.gpg = {
      enable = true;
      scdaemonSettings = {
        disable-ccid = true;
      };
    };
  };
}
