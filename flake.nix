{
  description = "NixOS Configuration";

  inputs = {
    # keep-sorted start block=yes
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    focal = {
      url = "github:iynaix/focal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hermux = {
      url = "github:c2fc2f/hermux";
      # url = "git+file:///home/culottes/git/hermes-mux/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      # url = "git+file:///home/culottes/git/nixpkgs/";
      url = "github:nixos/nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "github:outfoxxed/quickshell";
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
    # keep-sorted end
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
      systemInfo = {
        # keep-sorted start block=yes
        icare = {
          username = "culottes";
          groups = [
            # keep-sorted start
            "additional"
            "server"
            "vpn"
            # keep-sorted end
          ];
        };
        niobe = {
          username = "culottes";
          groups = [
            # keep-sorted start
            "additional"
            "development"
            "vpn"
            "workstation"
            # keep-sorted end
          ];
        };
        sisyphe = {
          username = "culottes";
          groups = [
            # keep-sorted start
            "additional"
            "server"
            "vpn"
            # keep-sorted end
          ];
        };
        tantale = {
          username = "culottes";
          groups = [
            # keep-sorted start
            "additional"
            "development"
            "hermux-test"
            "laptop"
            "vpn"
            "workstation"
            # keep-sorted end
          ];
        };
        # keep-sorted end
      };

      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {
      formatter = eachSystem (pkgs: treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.check self;
      });

      nixosConfigurations = nixpkgs.lib.mapAttrs (
        hostName: entry:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit hostName;
            inherit systemInfo;
          }
          // entry
          // inputs;
          modules = [
            ./hosts
            ./modules
          ];
        }
      ) systemInfo;
    };
}
