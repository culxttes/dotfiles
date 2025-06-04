{ pkgs, username, ... }:
/*
  LibreOffice, a full-featured open-source office suite. It includes
  applications for word processing, spreadsheets, presentations, diagrams,
  databases, and more—compatible with Microsoft Office formats.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.libreoffice
    ];
  };
}
