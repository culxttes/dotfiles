{
  description = "C development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        hgcc_sh = pkgs.writeShellScriptBin "hgcc" ''
          ${pkgs.gcc}/bin/gcc -std=c23 -Wall -Wconversion -Werror -Wextra -Wpedantic -Wwrite-strings -O2 -o "$(dirname $1)/$(basename $1 .c)" $1
        '';
      in
      {
        devShells.default = pkgs.mkShell rec {
          buildInputs = with pkgs; [
            pkgs.gcc
            pkgs.gnumake
            pkgs.uncrustify
            pkgs.valgrind

            hgcc_sh
          ];
        };
      }
    );
}
