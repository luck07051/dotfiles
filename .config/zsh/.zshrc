unsetopt autocd beep        # No beep sound
set -o ignoreeof            # Prevent <C-D> to colse window
stty -ixon                  # Disable <C-S> and <C-Q> to stop shell

# The Function
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

# Edit line in vim by Ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line


# Alias
source "$ZDOTDIR/alias.zsh"

# Prompt
if [ -x "$(which starship)" ]; then
  eval "$(starship init zsh)"
else
  PS1="%B%F{cyan}%4~%f%b$ "
fi

# cd Alternatives
[ -x "$(which zoxide)" ] &&
  eval "$(zoxide init zsh --cmd cd)"


# Functions #
zsh_add_fun lf                # lf with several setup
zsh_add_fun nvim_man          # using nvim to read `man`
zsh_add_fun dir_mark          # goto dirmark
# zsh_add_fun fzf_local         # open or cd to selected
zsh_add_fun fzf_cd            # browser dir with fzf
zsh_add_fun yank              # yank prev command
# zsh_add_fun auto_ls           # ls when $PWD changed


# Plugins #
zsh_add_plug "Aloxaf/fzf-tab"
zsh_add_plug "zsh-users/zsh-completions"
# zsh_add_plug "zsh-users/zsh-autosuggestions"
zsh_add_plug "zsh-users/zsh-syntax-highlighting"

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+="_abbr_keybind_return"


# swallow
bindkey '^X^m' accept-line-swallow
zle -N accept-line-swallow acceptandswallow
acceptandswallow() {
    dwmswallow $WINDOWID
    zle accept-line
}

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
