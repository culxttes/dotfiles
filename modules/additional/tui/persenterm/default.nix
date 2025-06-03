{ pkgs, username, ... }:
/*
  presenterm, a terminal-based presentation tool. It allows writing and
  displaying slide decks directly in the terminal, often using Markdown or
  simple text formatting. Useful for lightweight, distraction-free
  presentations from the command line.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.mermaid-cli
      pkgs.presenterm
    ];
  };
}
