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
zstyle ":completion:*" menu yes select
zstyle ":completion:*" \
    matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Vim mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

# Alias
source "$XDG_CONFIG_HOME/zsh/alias.zsh"

# Use starship prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh --cmd cd)"


# PLUGINS #
# Adding plugin function {{{
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
# use fzf to select complete option
zsh_add_plugin "Aloxaf/fzf-tab"

zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
