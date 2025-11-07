{
  projectRootFile = "flake.nix";

  settings.verbose = 1;

  programs = {
    keep-sorted.enable = true;
    nixfmt.enable = true;

    yamlfmt = {
      enable = true;

      settings.formatter = {
        retain_line_breaks = true;
      };
    };
  };
}
