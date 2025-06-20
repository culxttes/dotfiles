{ pkgs, username, ... }:
/*
  hyperfine is a command-line benchmarking tool that allows you to
  measure and compare the execution time of commands with statistical
  accuracy.

  It's useful for benchmarking scripts, binaries, and CLI tools.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.hyperfine
    ];
  };
}
