{ pkgs, username, ... }:

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
        ssh = "kitten ssh";
        icat = "kitten icat";
        clipboard = "kitten clipboard";
        rebuild = "sudo nixos-rebuild switch --flake ~/git/dotfiles/";
        update = "sudo nix flake update --flake ~/git/dotfiles/ && sudo nixos-rebuild switch --upgrade --flake ~/git/dotfiles/";
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
