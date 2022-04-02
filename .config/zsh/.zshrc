#===================COMMON=====================#
# History
HISTSIZE=10000
SAVEHIST=10000
# less hittory
#export LESSHISTFILE=-

# No beep sound
unsetopt autocd beep
# Vim mode
bindkey -v

#====================ALIAS====================#
# F5 to resource
bindkey -s '\e[15~' 'source $XDG_CONFIG_HOME/zsh/.zshrc\n'
# Quick run filemanager
bindkey -s '^F' 'lf\n'


# Change working directories when exit filemanager
alias ranger='ranger --choosedir=/tmp/last-dir; \
    LASTDIR=`cat /tmp/last-dir`; cd "$LASTDIR"'
alias lf='lfrun -last-dir-path /tmp/last-dir; \
    LASTDIR=`cat /tmp/last-dir`; cd "$LASTDIR"'

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
# Auot make parent directories
alias mkdir="mkdir -p"

# vim
alias vim="nvim"
alias vw="nvim ~/vimwiki/index.md"

# ls
alias ls="exa -al --icons --group-directories-first --color=always"
alias ll="exa -al --icons --group-directories-first --color=always"
alias la="exa -a --icons --group-directories-first --color=always"
alias l="exa --icons --group-directories-first --color=always"

# grep
alias grep="grep --color=auto"

# git
alias gs="git status"
# for bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias cons="config status"
alias confs="config status"

# taskwarrior
alias t="task"
alias ts="task sync"
alias tt="taskwarrior-tui | task sync"

# matlab
alias ml="matlab -nodisplay"

# Fix config file path
# wget
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
# yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'



#====================MISC====================#
# Remap caps lock to Ctrl
setxkbmap -option ctrl:nocaps

# fzf
export FZF_DEFAULT_OPTS="--height 40% --color=pointer:5,gutter:-1,prompt:7 --info=inline"
export FZF_DEFAULT_COMMAND="fd --hidden \
    --ignore-file ~/.config/fzf/ignore-file --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Use starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"



#===================PLUG=====================#
source ~/.config/zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-completions"
    zstyle ":completion:*" menu yes select
    zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "Aloxaf/fzf-tab"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load #--verbose

