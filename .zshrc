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
export EDITOR="vim"
export LANG=en_US.UTF-8
export HISTORY_IGNORE='(ls|la|ll|cd|cd -|cd ..|pwd|exit|reboot|history|q)'
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:$HOME/.local/bin"
export PATH="${PATH}:$HOME/.config/rofi/scripts"


#====================ALIAS====================#
alias res="source ~/.zshrc"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# ls
alias ls="exa --icons --group-directories-first --color=always"
alias la="exa -a --icons --group-directories-first --color=always"
alias ll="exa -al --icons --group-directories-first --color=always"

# pacman and yay
#alias pacman="sudo pacman"
alias pacup="sudo pacman -Syy"

# grep
alias grep="grep --color=auto"

# git
alias gs="git status"
# for bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"



#===================PLUG=====================#
source ~/.zplug/init.zsh
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

# install by 
# $ yay -S shell-color-scripts
# the shell-color-scripts is placed in /opt/shell-color-scripts/colorscripts
# not use 'colorbars debian elfman hex illumina pukeskull rupees spectrum thebat tux'
colorscript random

# use starship prompt
# install by 
# $ sh -c "$(curl -fsSL https://starship.rs/install.sh)"
eval "$(starship init zsh)"


#===Auto Startx===#
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  startx
fi

