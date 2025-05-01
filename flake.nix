{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
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
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      systemInfo = [
        {
          hostName = "tantale";
          username = "culottes";
          systemTypes = [ "additional" "desktop" ];
        }
        {
          hostName = "sisyphe";
          username = "culottes";
          systemTypes = [ "additional" "server" ];
        }
      ];
    in
    {
      nixosConfigurations = builtins.listToAttrs (builtins.map
        (entry: {
          name = entry.hostName;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit (entry) username hostName systemTypes;
            } // inputs;
            modules = [ ./profiles ];
          };
        })
        systemInfo);
    };
}
