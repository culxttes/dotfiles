{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      extraPackages = [
        pkgs.jdk23
        pkgs.nodejs
        pkgs.ripgrep
        pkgs.tex-fmt
      ];
    };

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
