{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Lurgrid";
      userEmail = "lurgrid@sagbot.com";
      aliases = {
        pull-all = "!git pull && git submodule update --init --recursive";
      };
      extraConfig = {
        commit = {
          gpgSign = true;
        };
      };
    };
  };
}
