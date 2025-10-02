{ username, ... }:

{
  imports = [
    # keep-sorted start
    ./nix-deamon.nix
    ./settings.nix
    # keep-sorted end
  ];

  system.stateVersion = "25.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager.users.${username} = {
    home.stateVersion = "25.11";
  };
}
