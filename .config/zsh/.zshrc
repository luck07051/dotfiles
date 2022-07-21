unsetopt autocd beep        # No beep sound
set -o ignoreeof            # Prevent <C-D> to colse window
stty -ixon                  # Disable <C-S> and <C-Q> to stop shell

# Auto Complete #
autoload -U compinit
compinit
_comp_options+=(globdots)   # Include hidden files
zstyle ":completion:*" menu yes select
# Case insensitive
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Bindkey #
bindkey " " magic-space     # Expand `!!` and other history thing

# Vim mode #
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char   # Let backspace work normal
bindkey -M viins -s "^N" "^I"       # Use <C-N> to complete (map <C-N> to tab)

# Alias
source $ZDOTDIR/alias.zsh
# Some utility
source $ZDOTDIR/utils/init.zsh


eval "$(starship init zsh)"         # Use starship prompt
eval "$(zoxide init zsh --cmd cd)"  # Zoxide

# Plugins #
# Adding plugin function {{{
# I found this from https://www.youtube.com/watch?v=bTLYiNvRIVI
function zsh_add_file() { [[ -f "$ZDOTDIR/$1" ]] && source "$ZDOTDIR/$1" }
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [[ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]]; then
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}
#}}}
zsh_add_plugin "Aloxaf/fzf-tab"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$COLOR10"
