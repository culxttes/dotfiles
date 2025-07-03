{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.writeShellScriptBin "rebuild" ''
        #!/usr/bin/env bash

        set -euo pipefail

        case "''\${1-}" in
          "" )
            nixos-rebuild switch \
              --flake ~/git/dotfiles/ \
              --sudo
            ;;
          remote )
            nixos-rebuild switch \
              --flake ~/git/dotfiles/ \
              --build-host culottes@sisyphe.sagbot.com \
              --sudo
            ;;
          sisyphe )
            nixos-rebuild switch \
              --flake ~/git/dotfiles#sisyphe \
              --build-host culottes@sisyphe.sagbot.com \
              --target-host culottes@sisyphe.sagbot.com \
              --sudo \
              --ask-sudo-password
            ;;
          * )
            echo "Usage: $0 [remote|sisyphe]"
            exit 1
            ;;
        esac
      '')
    ];
  };
}
