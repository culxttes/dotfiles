{ pkgs, nixvim, username, ... }:

{
  home-manager.users.${username} = {
    imports = [
      nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
      enable = true;

      colorschemes.catppuccin = {
        enable = true;
      };

      globals.mapleader = " ";
      globals.maplocalleader = ",";

      opts = {
        list = true;
        listchars = {
          space = "·";
          tab = "⟶ ";
          trail = "•";
          eol = "↲";
        };

        number = true;

        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;
        smartindent = true;
      };

      imports = [
        ./plugins
        ./keymaps.nix
      ];
    };
  };
}
