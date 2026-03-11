# Load environment variables at top
. $HOME/.dotfiles/zsh/env.sh
. $HOME/.dotfiles/zsh/alias.sh
. $HOME/.dotfiles/zsh/keychain.sh
. $HOME/.dotfiles/zsh/vim_mode.sh
. $ZSH/oh-my-zsh.sh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. "$HOME/.cargo/env"

eval "$(zoxide init zsh)"
