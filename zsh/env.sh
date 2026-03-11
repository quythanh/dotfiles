# ====================================================
# User configuration
# ====================================================
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

# fcitx
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Create zcompdump file in this location
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HISTFILE=$ZSH/cache/.zsh_history

# pnpm
export PNPM_HOME="/home/quythanh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Add .NET Core SDK tools
export PATH="$PATH:/home/quythanh/.dotnet/tools"

# NOTE: DO NOT COMMIT THIS FILE WITH REAL API KEYS
# gemini-cli
export GEMINI_API_KEY="YOUR_GEMINI_API_KEY_HERE"
