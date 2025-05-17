{ pkgs, ... }:

{
  projectRootFile = "flake.nix";

  settings.verbose = 1;

  programs.nixfmt.enable = true;
}
