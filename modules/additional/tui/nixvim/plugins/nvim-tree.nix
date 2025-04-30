{
  plugins.nvim-tree = {
    enable = true;

    git = { ignore = false; };
  };

  keymaps = [{
    mode = "n";
    key = "<C-n>";
    action = ":NvimTreeToggle<CR>";
    options = {
      desc = "Toggle file explorer";
      silent = true;
    };
  }];
}
