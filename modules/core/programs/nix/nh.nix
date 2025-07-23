{ username, ... }:

{
  home-manager.users.${username} = {
    programs.nh = {
      enable = true;

      clean.enable = true;

      flake = "/home/${username}/git/dotfiles";
    };
  };
}
