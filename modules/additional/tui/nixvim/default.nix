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
    # keep-sorted start
    ./plugins
    # keep-sorted end
  ];

  home-manager.users.${username} = {
    imports = [
      # keep-sorted start
      nixvim.homeModules.nixvim
      # keep-sorted end
    ];

    programs.nixvim = {
      extraPackages = [
        pkgs.wl-clipboard
      ];

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
        # keep-sorted start
        ./keymaps.nix
        # keep-sorted end
      ];
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
