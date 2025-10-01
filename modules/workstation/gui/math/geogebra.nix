{ pkgs, username, ... }:
/*
  GeoGebra, an interactive mathematics software for learning and teaching. It
  combines geometry, algebra, spreadsheets, graphing, statistics, and calculus
  in a single easy-to-use platform.

  Widely used in education for visualizing math concepts.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.geogebra
    ];
  };
}
