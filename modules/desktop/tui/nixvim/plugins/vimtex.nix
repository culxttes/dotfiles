{ pkgs, ... }:

{
  plugins = {
    vimtex = {
      enable = true;

      texlivePackage = pkgs.texlive.combined.scheme-full;

      settings = {
        view_method = "zathura";
        view_zathura_check_libsynctex = false;
        compiler_clean_paths = [
          "_minted*"
        ];
        compiler_latexmk_engines = {
          "_" = "-lualatex";
        };
        compiler_latexmk = {
          options = [
            "-verbose"
            "-synctex=1"
            "-interaction=nonstopmode"
            "-file-line-error"
            "-shell-escape"
          ];
        };
      };
    };
  };

  environment.variables = {
    EDITOR = "nvim";
  };
}
