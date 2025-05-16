{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Culottes";
      userEmail = "culottes@sagbot.com";
      aliases = {
        pull-all = "!git pull && git submodule update --init --recursive";
      };
    };
  };
}
