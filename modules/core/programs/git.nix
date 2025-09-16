{ pkgs, username, ... }:
#
# Enables Git with user info and defines a pull-all alias.
#
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
