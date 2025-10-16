{ pkgs, username, ... }:

{
  home-manager.users.${username}.programs.nvf.settings.vim = {
    languages.python = {
      enable = true;

      format = {
        enable = true;

        package = pkgs.ruff;
        type = "ruff";
      };

      lsp = {
        enable = true;

        package = pkgs.pyright;
        server = "pyright";
      };

      treesitter = {
        enable = true;
      };
    };
  };
}
