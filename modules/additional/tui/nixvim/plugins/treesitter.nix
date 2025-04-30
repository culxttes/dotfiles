{ pkgs, ... }:

{
  extraPackages = [
    pkgs.gcc
    pkgs.git
    pkgs.nodejs
    pkgs.tree-sitter
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
