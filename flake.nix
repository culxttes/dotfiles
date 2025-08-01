{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    # nixpkgs.url = "git+file:///home/culottes/git/nixpkgs/";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    focal = {
      url = "github:iynaix/focal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hermux = {
      url = "github:culxttes/hermux";
      # url = "git+file:///home/culottes/git/hermes-mux/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      treefmt-nix,
      ...
    }@inputs:
    let
      systemInfo = [
        {
          hostName = "tantale";
          username = "culottes";
          systemTypes = [
            "additional"
            "development"
            "desktop"
            "hermux-test"
          ];
        }
        {
          hostName = "sisyphe";
          username = "culottes";
          systemTypes = [
            "additional"
            "server"
          ];
        }
      ];

      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {
      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      nixosConfigurations = builtins.listToAttrs (
        builtins.map (entry: {
          name = entry.hostName;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit (entry) username hostName systemTypes;
            }
            // inputs;
            modules = [
              ./hosts
              ./modules
              ./users
            ];
          };
        }) systemInfo
      );
    };
}
