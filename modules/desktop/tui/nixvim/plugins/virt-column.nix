{ pkgs, ... }:

{
  plugins = {
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
