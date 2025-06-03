{
  pkgs,
  nixvim,
  username,
  ...
}:
/*
  NixVim, a Neovim setup managed through Nix. It allows declarative
  configuration of plugins, keybindings, themes, and language support directly
  within the Nix ecosystem.
*/
{
  imports = [
    ./plugins
  ];

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

      clipboard = {
        register = "unnamedplus";
      };

      extraConfigLua = ''
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*",
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      '';

      imports = [
        ./keymaps.nix
      ];
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
