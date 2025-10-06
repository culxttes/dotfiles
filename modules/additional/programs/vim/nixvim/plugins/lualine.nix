{ username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        disabled_filetypes = {
          statusline = [
            "NvimTree"
            "packer"
            "TelescopePrompt"
            "neo-tree"
          ];
          winbar = [
            "NvimTree"
            "packer"
            "TelescopePrompt"
            "neo-tree"
          ];
        };
      };
    };
  };
}
