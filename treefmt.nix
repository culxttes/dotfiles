{ pkgs, ... }:

{
  projectRootFile = "flake.nix";

  settings.verbose = 1;

  programs.keep-sorted.enable = true;
  programs.nixfmt.enable = true;

  programs.yamlfmt = {
    enable = true;

    settings.formatter = {
      retain_line_breaks = true;
    };
  };
}
