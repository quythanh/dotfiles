# Standard plugins in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  vi-mode
)

# Enable vim mode
bindkey -v
bindkey -M viins jk vi-cmd-mode
