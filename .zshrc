# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

# ====================================================
# User configuration
# ====================================================
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export WAKATIME_HOME="$HOME/.dotfiles/wakatime"
# create zcompdump file in this location
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export HISTFILE=$ZSH/cache/.zsh_history

alias lsa="ls -la"
alias vi="nvim"
alias astah="astah-uml -nojvchk"
alias msedge-dev="microsoft-edge-dev -enable-features=UseOzonePlatform -ozone-platform=wayland"

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

eval "$(ssh-agent -s)"
clear

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.dotfiles/.p10k.zsh
