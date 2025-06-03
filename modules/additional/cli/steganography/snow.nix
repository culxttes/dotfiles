{ pkgs, username, ... }:
/*
  snow, a steganography tool used to conceal messages in ASCII text files. It
  hides data by adding extra whitespace (spaces and tabs) at the end of lines,
  making it useful for covert communication or watermarking without altering
  visible content.
*/
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.snow
    ];
  };
}
