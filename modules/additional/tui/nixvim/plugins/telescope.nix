{ pkgs, ... }:

{
  extraPackages = with pkgs; [ ripgrep fd ];

  plugins.telescope.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = ":Telescope find_files<CR>";
      options = {
        desc = "Find Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = ":Telescope live_grep<CR>";
      options = {
        desc = "Live Grep";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers<CR>";
      options = {
        desc = "Find Buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":Telescope help_tags<CR>";
      options = {
        desc = "Find Help Tags";
        silent = true;
      };
    }
  ];
}
