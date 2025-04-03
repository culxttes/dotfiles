{ pkgs, username, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home-manager.users.${username} = {
    home.packages = [
      pkgs.ripgrep
    ];

    xdg.configFile = {
      nvim = {
        source = ./config;
      };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
