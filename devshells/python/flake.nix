{
  description = "Python devshell with requests";

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
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        # nix run github:nix-community/pip2nix -- generate -r requirements.txt
        # nix run github:nix-community/pip2nix -- generate panda
        packageOverrides = pkgs.callPackage ./python-packages.nix { };
        python = pkgs.python3.override {
          inherit packageOverrides;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            (python.withPackages (
              ps: with ps; [
                # packages
              ]
            ))
          ];
        };
      }
    );
}
