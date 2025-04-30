{ username, ... }:

{
  imports = [ ./settings.nix ];

  system.stateVersion = "25.05";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager.users.${username} = { home.stateVersion = "25.05"; };
}
