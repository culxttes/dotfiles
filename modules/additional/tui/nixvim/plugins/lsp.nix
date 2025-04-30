{ config, ... }:

{
  imports = [ (import ../lsp { inherit config; }) ];

  plugins.lsp = { enable = true; };

  keymaps = [
    {
      mode = "n";
      key = "<C-²>";
      action = ":lua vim.lsp.buf.code_action()<CR>";
      options = {
        desc = "LSP Code Action";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ih";
      action =
        ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
      options = {
        desc = "Toggle Inlay Hint";
        silent = true;
      };
    }
  ];
}
