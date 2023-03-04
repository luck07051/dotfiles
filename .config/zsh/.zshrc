# vim:foldmethod=marker:foldlevel=0

# Source function
function zsh_add_file() { #{{{
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
} #}}}
function zsh_add_plug() { #{{{
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
  if [[ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]]; then
    # For plugins
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
  fi
} #}}}

unsetopt autocd beep        # No beep sound
set -o ignoreeof            # Prevent <C-D> to close window
stty -ixon                  # Disable <C-S> and <C-Q> to stop shell

# Auto Complete
autoload -U compinit
compinit
_comp_options+=(globdots)           # Include hidden files
zstyle ":completion:*" menu yes select
# Case insensitive
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Auto cd
setopt autocd

# Vim Mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char   # Let backspace work normal
bindkey -M viins -s "^N" "^I"       # Use <C-N> to complete (map <C-N> to tab)
# Edit command in vim by <C-e>:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Prompt
if [ -x "$(which starship)" ]; then
  eval "$(starship init zsh)"
else
  setopt PROMPT_SUBST  # enable function in prompt
  PS1="%B%F{cyan}%4~%f%b%(?.%F{white}.%F{red})$%f "
  PS2=">"
  # zsh_add_file "functions/timer.zsh"
  # zsh_add_file "functions/vcs.zsh"
  # RPS1='${timer}'
fi

# cd Alternatives
type zoxide >/dev/null &&
  eval "$(zoxide init zsh --cmd cd)"

# fzf config
[ -f "$XDG_CONFIG_HOME/fzf/config.sh" ] &&
  source "$XDG_CONFIG_HOME/fzf/config.sh"

# Alias
zsh_add_file "functions/abbr.zsh"
zsh_add_file "alias.zsh"
zsh_add_file "local_alias.zsh"

# Util
zsh_add_file "functions/yank.zsh"          # <C-y> to yank prev command
# zsh_add_file "functions/lf.zsh"            # file manager 'lf'
# zsh_add_file "functions/auto_ls.zsh"       # run ls when $PWD changed

# Plugins
zsh_add_plug "Aloxaf/fzf-tab"
zsh_add_plug "zsh-users/zsh-completions"
zsh_add_plug "zsh-users/zsh-syntax-highlighting"
