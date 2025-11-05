{ username, ... }:

{
  home-manager.users.${username}.programs.nvf.settings.vim = {
    clipboard = {
      enable = true;

      providers.wl-copy = {
        enable = true;
      };

      registers = "unnamedplus";
    };
  };
}
