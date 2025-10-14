{ nvf, username, ... }:

{
  imports = [
    # keep-sorted start
    ./binds
    ./keymaps
    ./languages
    # keep-sorted end
  ];

  home-manager.users.${username} = {
    imports = [
      # keep-sorted start
      nvf.homeManagerModules.default
      # keep-sorted end
    ];

    programs.nvf = {
      enable = true;

      enableManpages = true;

      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          globals = {
            mapleader = " ";
            maplocalleader = ",";
          };

          clipboard = {
            enable = true;

            providers.wl-copy = {
              enable = true;
            };

            registers = "unnamedplus";
          };

          options = {
            expandtab = true;
            shiftwidth = 2;
            tabstop = 2;
            softtabstop = 2;
            smartindent = true;
          };

          lsp = {
            enable = true;

            formatOnSave = true;

            lspconfig = {
              enable = true;
            };
          };

          treesitter = {
            enable = true;
          };

          filetree = {
            neo-tree = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
