{ config, username, ... }:

{
  imports = [
    ./secrets
  ];

  services.github-runners = {
    dotfiles = {
      enable = true;

      name = "nixos-runner";

      url = "https://github.com/culxttes/dotfiles";

      tokenFile = config.sops.secrets."github-runner/dotfiles/token".path;
    };
  };
}
