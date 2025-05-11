{ pkgs, username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    plugins.none-ls.sources.formatting.nixfmt = {
      enable = true;
      package = pkgs.nixfmt-rfc-style;
    };
  };
}
