{ pkgs, username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins = {
    virt-column = {
      enable = true;
      settings = {
        char = "│";
        virtcolumn = "80";
        highlight = "ColorColumn";
      };
    };
  };
}
