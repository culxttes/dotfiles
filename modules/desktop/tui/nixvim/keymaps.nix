{
  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Move to left split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Move to down split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Move to up split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Move to right split";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = ":resize -2<CR>";
      options = {
        desc = "Resize window up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = ":resize +2<CR>";
      options = {
        desc = "Resize window down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options = {
        desc = "Resize window left";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = ":vertical resize +2<CR>";
      options = {
        desc = "Resize window right";
        silent = true;
      };
    }
  ];
}