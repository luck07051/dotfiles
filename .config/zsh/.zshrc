# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME"/zsh/history

# No beep sound
unsetopt autocd beep

# Auto Complete
autoload -U compinit
compinit
_comp_options+=(globdots)   # Include hidden files

# Vim mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

# Source Alias file
source $XDG_CONFIG_HOME/zsh/zsh_alias

# Remap caps lock to Ctrl
setxkbmap -option ctrl:nocaps

# fzf
source $XDG_CONFIG_HOME/fzf/config.zsh

# Use starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"



#===================PLUG=====================#
source ~/.config/zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# use fzf to select complete option
zplug "Aloxaf/fzf-tab"

zplug "zsh-users/zsh-completions"
    zstyle ":completion:*" menu yes select
    zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load #--verbose

