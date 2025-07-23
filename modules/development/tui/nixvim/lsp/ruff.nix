{ config, username, ... }:

{
  home-manager.users.${username}.programs.nixvim.plugins = {
    lsp.servers.ruff = {
      enable = true;
    };

    cmp = {
      settings = {
        sources = [
          { name = "ruff"; }
        ];
      };
    };
  };
}
