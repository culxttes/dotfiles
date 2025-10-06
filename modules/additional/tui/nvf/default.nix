{ nvf, username, ... }:

{
  home-manager.users.${username} = {
    imports = [
      # keep-sorted start
      nvf.homeManagerModules.default
      # keep-sorted end
    ];

    programs.nvf = {
      enable = false;

      enableManpages = true;

      settings = {
        vim.viAlias = false;
        vim.vimAlias = true;
        vim.lsp = {
          enable = true;
          formatOnSave = false;
          lspconfig.enable = true;
        };
      };
    };
  };
}
