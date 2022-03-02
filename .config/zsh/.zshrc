#===================COMMON=====================#
# History
HISTSIZE=10000
SAVEHIST=10000
# No beep sound
unsetopt autocd beep
# Set vim mode
bindkey -v
# Prompt
prompt="[%F{blue}%~%f]%F{blue}%# "


#====================ALIAS====================#
# F5 to resource
bindkey -s '\e[15~' 'source $XDG_CONFIG_HOME/zsh/.zshrc\n'
# Quick run filemanager
bindkey -s '^F' 'ranger\n'

# Quick start
alias v="nvim"
alias f="ranger"

# Confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias mkdir="mkdir -p"

# vim
alias vim="nvim"
alias vw="nvim ~/vimwiki/index.md"

# ls
alias ls="exa -al --icons --group-directories-first --color=always"
alias ll="exa -al --icons --group-directories-first --color=always"
alias la="exa -a --icons --group-directories-first --color=always"
alias l="exa --icons --group-directories-first --color=always"

# pacman and yay
#alias pacman="sudo pacman"
alias pacup="sudo pacman -Syu"

# grep
alias grep="grep --color=auto"

# git
alias gs="git status"
# for bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# wget
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

# taskwarrior
alias t="task"
alias ts="task sync"


#===================PLUG=====================#
source ~/.config/zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-completions"
    zstyle ":completion:*" menu yes select
    zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"



# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load #--verbose


#====================MISC====================#
# Remap caps lock to Ctrl
setxkbmap -option ctrl:nocaps

# Use starship prompt
# install by
# $ sh -c "$(curl -fsSL https://starship.rs/install.sh)"
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"



