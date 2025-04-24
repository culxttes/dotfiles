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
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    username = "culottes";
    hostName = "tantale";
    systemType = "desktop";
  in 
  {
    nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit username;
        inherit hostName;
        inherit systemType;
      } // inputs;
      modules = [
        ./profiles/${systemType}.nix
        ./profiles
      ];
    };
  };
}
