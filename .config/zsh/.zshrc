unsetopt autocd beep        # No beep sound
set -o ignoreeof            # Prevent <C-D> to colse window
stty -ixon                  # Disable <C-S> and <C-Q> to stop shell

# The function #
function zsh_add_fun() { #{{{
  file="$ZDOTDIR/functions/$1.zsh"
  if [ -f "$file" ]; then
    source $file
  fi
}
#}}}
function zsh_add_plug() { #{{{
  function zsh_add_file() {
    [[ -f "$ZDOTDIR/$1" ]] && source "$ZDOTDIR/$1"
  }

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

# Auto Complete #
autoload -U compinit
compinit
_comp_options+=(globdots)           # Include hidden files
zstyle ":completion:*" menu yes select
# Case insensitive
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Vim mode #
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char   # Let backspace work normal
bindkey -M viins -s "^N" "^I"       # Use <C-N> to complete (map <C-N> to tab)

# Edit line in vim by ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line


# Alias
source $ZDOTDIR/alias.zsh

eval "$(starship init zsh)"         # Use starship prompt
eval "$(zoxide init zsh)"           # Zoxide


# Functions #
zsh_add_fun lf
zsh_add_fun nvim_man
zsh_add_fun dir_mark
# zsh_add_fun fzf_local
zsh_add_fun yank
# zsh_add_fun auto_ls


# Plugins #
zsh_add_plug "Aloxaf/fzf-tab"
zsh_add_plug "zsh-users/zsh-completions"
zsh_add_plug "zsh-users/zsh-autosuggestions"
zsh_add_plug "zsh-users/zsh-syntax-highlighting"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444"
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+="magic_abbr_return"


# function sconda() {
#   # >>> conda initialize >>>
#   # !! Contents within this block are managed by 'conda init' !!
#   __conda_setup="$('/home/ui/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#   if [ $? -eq 0 ]; then
#       eval "$__conda_setup"
#   else
#       if [ -f "/home/ui/anaconda3/etc/profile.d/conda.sh" ]; then
#           . "/home/ui/anaconda3/etc/profile.d/conda.sh"
#       else
#           export PATH="/home/ui/anaconda3/bin:$PATH"
#       fi
#   fi
#   unset __conda_setup
#   # <<< conda initialize <<<
# }
