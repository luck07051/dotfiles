# vim:foldmethod=marker:foldlevel=0

unsetopt autocd beep        # No beep sound
set -o ignoreeof            # Prevent <C-D> to close window
stty -ixon                  # Disable <C-S> and <C-Q> to stop shell

# Source function
function zsh_add_file() { #{{{
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}
#}}}
function zsh_add_util() { #{{{
  file="functions/$1.zsh"
  zsh_add_file "$file"
}
#}}}
function zsh_add_plug() { #{{{
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

# Auto Complete
autoload -U compinit
compinit
_comp_options+=(globdots)           # Include hidden files
zstyle ":completion:*" menu yes select
# Case insensitive
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Vim Mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char   # Let backspace work normal
bindkey -M viins -s "^N" "^I"       # Use <C-N> to complete (map <C-N> to tab)
bindkey "^J" down-line-or-search
bindkey "^K" up-line-or-search

# Edit command in vim by <C-e>:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line


# Prompt
if [ -x "$(which starship)" ]; then
  eval "$(starship init zsh)"
else
  PS1="%B%F{cyan}%4~%f%b%(?.%F{white}.%F{red})$%f "
  PS2=">"
fi

# cd Alternatives
[ -x "$(which zoxide)" ] &&
  eval "$(zoxide init zsh --cmd cd)"


# Alias
zsh_add_file "functions/abbr.zsh"
zsh_add_file "alias.zsh"
zsh_add_file "local_alias.zsh"

# Util
zsh_add_file "functions/lf.zsh"            # lf with several setup
zsh_add_file "functions/yank.zsh"          # <C-y> to yank prev command
# zsh_add_file "functions/auto_ls.zsh"       # run ls when $PWD changed

# Plugins
zsh_add_plug "Aloxaf/fzf-tab"
zsh_add_plug "zsh-users/zsh-completions"
# zsh_add_plug "zsh-users/zsh-autosuggestions"
#   ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"
#   ZSH_AUTOSUGGEST_CLEAR_WIDGETS+="_abbr_keybind_return"
#   ZSH_AUTOSUGGEST_CLEAR_WIDGETS+="_abbr_keybind"
zsh_add_plug "zsh-users/zsh-syntax-highlighting"
