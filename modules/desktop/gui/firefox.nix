{
  pkgs,
  username,
  firefox,
  ...
}:

{
  home-manager.users.${username} = {
    home.packages = [
      firefox.packages.${pkgs.system}.firefox-nightly-bin
    ];

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
