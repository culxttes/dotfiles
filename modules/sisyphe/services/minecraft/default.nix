{ nix-minecraft, ... }:

{
  imports = [
    # keep-sorted start
    ./oceanblock2.nix
    ./skyfactory5.nix
    nix-minecraft.nixosModules.minecraft-servers
    # keep-sorted end
  ];
  nixpkgs.overlays = [
    nix-minecraft.overlay
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
  };
}
