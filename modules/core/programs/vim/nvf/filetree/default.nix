{ username, ... }:

{
  home-manager.users.${username}.programs.nvf.settings.vim = {
    treesitter = {
      enable = true;
    };
  };
}
