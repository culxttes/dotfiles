{ pkgs, ... }:

{
  fonts = {
    # Enable the system-wide font directory
    fontDir.enable = true;

    fontconfig.enable = true;
  };
}
