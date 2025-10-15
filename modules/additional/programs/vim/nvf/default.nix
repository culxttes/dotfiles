{ nvf, username, ... }:

{
  imports = [
    # keep-sorted start
    ./autocomplete
    ./binds
    ./clipboard
    ./filetree
    ./keymaps
    ./languages
    ./lsp
    ./options
    ./tabline
    ./telescope
    ./theme
    ./treesitter
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

          syntaxHighlighting = true;

          globals = {
            mapleader = " ";
            maplocalleader = ",";
          };
        };
      };
    };
  };
}
