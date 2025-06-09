{ pkgs, username, ... }:
/*
  rusty-man, a terminal-based manual viewer for Rust crates. It provides
  manpage-style access to Rust documentation directly from the CLI, enabling
  quick lookups of crate docs without needing to open a browser.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.rusty-man
    ];
  };
}
