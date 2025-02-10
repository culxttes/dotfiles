plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ssh="kitten ssh"
alias icat="kitten icat"
alias clipboard="kitten clipboard"
alias scala="scala3"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
eval "$(zoxide init --cmd cd zsh)"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
