{ config, username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins = {
    lsp.servers.pyright = {
      enable = true;
    };

    cmp = {
      settings = {
        sources = [
          { name = "pyright"; }
        ];
      };
    };
  };
}
