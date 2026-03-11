# Standard plugins in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  vi-mode
)

# Enable vim mode
bindkey -v
bindkey -M viins jk vi-cmd-mode

# Load environment variables at top
. $HOME/.dotfiles/zsh/export_env.sh
. $HOME/.dotfiles/zsh/alias.sh
. $HOME/.dotfiles/zsh/keychain.sh
. $ZSH/oh-my-zsh.sh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. "$HOME/.cargo/env"

# ----------------------------------------

eval "$(zoxide init zsh)"
