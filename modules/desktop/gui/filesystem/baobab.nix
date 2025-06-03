{ pkgs, username, ... }:
/*
  Baobab, also known as Disk Usage Analyzer. It is a graphical tool that scans
  and visualizes disk usage, helping users identify large files and
  directories via an interactive UI.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.baobab
    ];
  };
}
