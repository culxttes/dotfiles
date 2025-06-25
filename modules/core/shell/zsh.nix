{
  pkgs,
  config,
  username,
  ...
}:

{
  programs.zsh = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  home-manager.users.${username} = {

    home.packages = [
      pkgs.zoxide
      pkgs.yazi
    ];

    programs.zsh = {
      enable = true;
      autocd = true;
      shellAliases = {
        rebuild = ''
          sudo \
            NIX_SSHOPTS="-i /home/culottes/.ssh/sisyphe" \
          nixos-rebuild switch \
            --flake ~/git/dotfiles/ \
            --build-host culottes@sisyphe.sagbot.com
        '';
        rebuild-local = ''
          sudo nixos-rebuild switch --flake ~/git/dotfiles/
        '';
        update = ''
          NIX_CONFIG="access-tokens = github.com=$(sudo cat ${
            config.sops.secrets."github/token/readonly".path
          })" nix flake update --flake ~/git/dotfiles/
        '';
        update-commit = ''
          git commit -m "chore(flake.lock): update dependencies" -n
        '';
      };
      initContent = ''
        eval "$(zoxide init --cmd cd zsh)"

        function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }

        nix() {
          if [[ $1 == "develop" ]]; then
            shift
            command nix develop -c $SHELL "$@"
          else
            command nix "$@"
          fi
        }
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
      };
    };
  };
}
