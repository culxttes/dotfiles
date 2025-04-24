{
  plugins.toggleterm.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>th";
      action = ":ToggleTerm direction=horizontal<CR>";
      options = {
        desc = "Toggle Terminal Horizontal";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = ":ToggleTerm direction=vertical<CR>";
      options = {
        desc = "Toggle Terminal Vertical";
        silent = true;
      };
    }
    {
      mode = "t"; # terminal mode
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Exit terminal mode";
        silent = true;
      };
    }
  ];
}