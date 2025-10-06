{
  pkgs,
  username,
  config,
  ...
}:

{
  imports = [
    # keep-sorted start
    ./secrets
    # keep-sorted end
  ];

  home-manager.users.${username} = {
    home.packages = [
      (pkgs.writeShellScriptBin "update" ''
        #!/usr/bin/env bash

        set -euo pipefail

        case "''\${1-}" in
          "" )
            NIX_CONFIG="access-tokens = github.com=$(cat ${
              config.sops.secrets."github/token/readwrite".path
            })" nix flake update --flake ~/git/dotfiles/
            ;;
          commit )
            git commit -m "chore(flake.lock): update dependencies" -n
            ;;
          * )
            echo "Usage: $0 [commit]"
            exit 1
            ;;
        esac
      '')
    ];
  };
}
