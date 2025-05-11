{ pkgs, username, ... }:

{
  home-manager.users.${username}.programs.nixvim = {
    extraPackages = with pkgs; [
      gcc
      git
      nodejs
      tree-sitter
    ];

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = "all";
        };
      };
    };
  };
}
