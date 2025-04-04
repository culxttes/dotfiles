{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file.".uncrustify_c.cfg".source = ./assets/.uncrustify_c.cfg;
  };
}
