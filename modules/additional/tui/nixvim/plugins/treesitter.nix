{ pkgs, ... }:

{
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
}
