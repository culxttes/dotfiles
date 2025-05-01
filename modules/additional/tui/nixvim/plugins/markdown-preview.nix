{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    nodejs
  ];

  plugins.markdown-preview = {
    enable = true;
  };

  keymaps = [{
    mode = "n";
    key = "<leader>mp";
    action = ":MarkdownPreview<CR>";
    options = {
      desc = "Markdown Preview";
      silent = true;
    };
  }];
}
