{ pkgs, username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    plugins.none-ls.sources.diagnostics.mypy = {
      enable = true;
    };
  };
}
