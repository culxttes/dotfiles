{ pkgs, username, ... }:
/*
  Inkscape, a professional-grade open-source vector graphics editor. It's used
  to create and edit SVG files and supports drawing tools, path operations,
  text manipulation, and export to various formats.

  Ideal for illustrations, diagrams, and graphic design work.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.inkscape
    ];
  };
}
