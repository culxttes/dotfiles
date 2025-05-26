{
  pkgs,
  username,
  firefox,
  ...
}:

{
  home-manager.users.${username} = {
    programs.firefox = {
      enable = true;
      package = firefox.packages.${pkgs.system}.firefox-nightly-bin;
    };

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
