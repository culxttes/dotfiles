{ pkgs, username, ... }:
let
  hgcc_sh = pkgs.writeShellScriptBin "hgcc" ''
    ${pkgs.gcc}/bin/gcc -std=c23 -Wall -Wconversion -Werror -Wextra -Wpedantic -Wwrite-strings -O2 -o "$(dirname $1)/$(basename $1 .c)" $1
  '';
in
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.gcc
      pkgs.gnumake
      pkgs.uncrustify

      hgcc_sh
    ];

    home.file.".uncrustify_c.cfg".source = ./assets/.uncrustify_c.cfg;
  };
}
