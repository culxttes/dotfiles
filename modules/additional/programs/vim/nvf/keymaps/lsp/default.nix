{ username, ... }:

{

  home-manager.users.${username} = {
    programs.nvf.settings.vim.keymaps = [
      {
        mode = "n";
        key = "²";
        action = ":lua vim.diagnostic.open_float()<CR>";
        desc = "Open LSP diagnostics float";
        silent = true;
      }
      {
        mode = "n";
        key = "<C-²>";
        action = ":lua vim.lsp.buf.code_action()<CR>";
        desc = "LSP Code Action";
        silent = true;
      }
    ];
  };
}
