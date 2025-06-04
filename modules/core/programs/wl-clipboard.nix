{ pkgs, username, ... }:
/*
  wl-clipboard, a command-line clipboard utility for Wayland compositors. It
  provides `wl-copy` and `wl-paste` commands to interact with the system
  clipboard, similar to `xclip` or `xsel` on X11. Useful for scripting and
  terminal-based workflows.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.wl-clipboard
    ];
  };
}
