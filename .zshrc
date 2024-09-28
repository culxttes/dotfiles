export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ssh="kitten ssh"
alias icat="kitten icat"
alias clipboard="kitten clipboard"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
eval "$(zoxide init --cmd cd zsh)"
