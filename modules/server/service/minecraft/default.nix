{ nix-minecraft, ... }:

{
  imports = [
    nix-minecraft.nixosModules.minecraft-servers
    ./skyfactory5.nix
  ];
  nixpkgs.overlays = [
    nix-minecraft.overlay
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
  };
}
