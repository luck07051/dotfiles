# No beep sound
unsetopt autocd beep
# F5 to resource
bindkey -s '\e[15~' 'source $ZDOTDIR/.zshrc\n'


# Auto Complete
autoload -U compinit
compinit
_comp_options+=(globdots)   # Include hidden files
zstyle ":completion:*" menu yes select
# Case insensitive
zstyle ":completion:*" matcher-list \
    "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"


# Vim mode
bindkey -v
export KEYTIMEOUT=1
# Let backspace work normal
bindkey "^?" backward-delete-char
# Use <C-N> to complete (map <C-N> to tab)
bindkey -M viins -s "^N" "^I"


# Alias
source "$XDG_CONFIG_HOME/zsh/alias.zsh"

# Use starship prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# PLUGINS #
# Adding plugin function {{{
# I found this function on https://www.youtube.com/watch?v=bTLYiNvRIVI
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

# Use fzf to select complete option
zsh_add_plugin "Aloxaf/fzf-tab"
# Additional completion definitions
zsh_add_plugin "zsh-users/zsh-completions"
# Suggests from history
zsh_add_plugin "zsh-users/zsh-autosuggestions"
# Syntax highlighting
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
