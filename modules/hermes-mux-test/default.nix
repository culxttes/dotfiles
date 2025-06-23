{
  hermes-mux,
  pkgs,
  username,
  ...
}:

{
  home-manager.users.${username} = {
    home.packages = [
      hermes-mux.packages.${pkgs.system}.default
    ];
  };
}
