#===================COMMON=====================#
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# no beep sound
unsetopt autocd beep
# set vim mode
bindkey -v      
# prompt
prompt="[%F{blue}%~%f]%F{blue}%# "


#====================EXPORT====================#
export TERM="xterm-256color"
export DEITOR="vim"
export LANG=en_US.UTF-8


#====================ALIAS====================#
alias res='source ~/.zshrc'
# for quick login window manager
alias q='startx'
# for bare Git repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


# ls
alias ls='exa --icons --group-directories-first --color=always'
alias la='exa -a --icons --group-directories-first --color=always'
alias ll='exa -al --icons --group-directories-first --color=always'
alias lt='exa -aT --icons --group-directories-first --color=always'

# pacman and yay

# git
alias gs="git status"



#===================Plug=====================#
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug "romkatv/powerlevel10k", as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-completions"
    zstyle ':completion:*' menu yes select
    zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
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
