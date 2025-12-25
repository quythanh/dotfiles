# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    vi-mode
)

# Enable vim mode
bindkey -v
bindkey -M viins jk vi-cmd-mode

# Just add this for my layout 60% keyboard
bindkey "^F" autosuggest-accept

# ====================================================
# User configuration
# ====================================================
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
# create zcompdump file in this location
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HISTFILE=$ZSH/cache/.zsh_history

source $HOME/.config/zsh/alias.conf
source $HOME/.config/zsh/export_env.conf

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# --- SSH Agent Management using Keychain ---

# The 'keychain' utility is used here to manage a single, persistent ssh-agent 
# across multiple terminal sessions (Zsh tabs/windows). This prevents the creation 
# of multiple ssh-agent processes and requires the user to enter their SSH key 
# passphrase only once per system startup.

# 1. keychain: Executes the keychain utility.
# 2. --quiet: Suppresses verbose output (warnings, startup messages).
# 3. --eval: Instructs keychain to output the 'export' commands needed to set 
#    environment variables (like SSH_AGENT_PID and SSH_AUTH_SOCK).
# 4. id_ed25519: Specifies the SSH key file to be managed and automatically loaded 
#    into the agent.
# 5. $(): Captures the output (the 'export' commands) of the keychain command.
# 6. eval: Executes the captured 'export' commands within the current Zsh shell.
# RESULT: All new terminal shells connect to the same existing ssh-agent.
if [[ -o interactive ]]; then
    if command -v keychain &> /dev/null; then
        # Thêm khóa của bạn vào đây, nếu cần. Keychain sẽ kiểm tra
        # xem khóa đã được thêm vào agent chưa.
        eval "$(keychain --quiet --eval id_ed25519)"
    fi
fi

# ----------------------------------------

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.dotfiles/.p10k.zsh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. "$HOME/.cargo/env"

alias l="lsd -la"

# pnpm
export PNPM_HOME="/home/quythanh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Add .NET Core SDK tools
export PATH="$PATH:/home/quythanh/.dotnet/tools"

# gemini-cli
export GEMINI_API_KEY="AIzaSyAphfqRhVvrEHAUnDaIX6Vxl1EMGpET0S8"
