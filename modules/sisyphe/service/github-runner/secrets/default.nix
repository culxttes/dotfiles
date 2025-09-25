{ config, ... }:

{
  sops.secrets."github-runner/dotfiles/token" = {
    sopsFile = ./secrets.yaml;

    owner = config.services.github-runners.dotfiles.user;
    group = config.services.github-runners.dotfiles.group;
  };
}
