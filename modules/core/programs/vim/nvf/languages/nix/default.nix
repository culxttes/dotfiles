{ pkgs, username, ... }:

{

  home-manager.users.${username} = {
    programs.nvf.settings.vim.languages.nix = {
      enable = true;

      extraDiagnostics.enable = true;

      format = {
        enable = true;

        package = pkgs.nixfmt-rfc-style;
        type = "nixfmt";
      };

      lsp = {
        enable = true;
      };

      treesitter = {
        enable = true;
      };
    };
  };
}
