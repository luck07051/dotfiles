#==================== XDG Paths ====================#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# export XDG_RUNTIME_DIR=

#==================== Bin Paths ====================#
# Add ~/.local/bin and its subdir to path
export PATH="${PATH}:$(find $XDG_BIN_HOME -type d -printf "%p:" | sed -e 's/:$//g')"

[ -f $XDG_DATA_HOME/cargo/env ] && . $XDG_DATA_HOME/cargo/env


#==================== ====================#
export EDITOR='nvim'
# export TERMINAL='kitty'
export TERMINAL='alacritty'
export BROWSER='firefox'

export LANG=en_US.UTF-8
#export TERM="xterm-256color"

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=$XDG_CACHE_HOME/history
export HISTORY_IGNORE="(ls|cd|history|lf|exit|reboot)"

# FZF
export FZF_DEFAULT_OPTS="--bind ctrl-j:down,ctrl-k:up --height 40% \
    --color=pointer:5,gutter:-1,prompt:7 --info=default "
export FZF_DEFAULT_COMMAND="fd -HL --exclude '.git' --type file"


# Colors
export COLOR00='#1C1C1C'
export COLOR01='#E67e80'
export COLOR02='#87AF87'
export COLOR03='#EBCB8B'
export COLOR04='#81A1C1'
export COLOR05='#FFB9DC'
export COLOR06='#87AFAF'
export COLOR07='#D0D0D0'
export COLOR08='#1C1C1C'
export COLOR09='#303030'
export COLOR10='#444444'
export COLOR11='#585858'
export COLOR12='#6C6C6C'
export COLOR13='#8A8A8A'
export COLOR14='#A8A8A8'
export COLOR15='#BCBCBC'

#==================== Let Paths Right ====================#
# X11
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc
export XAUTHORITY=$XDG_CONFIG_HOME/X11/xauthority
# cabal
export CABAL_CONFIG=$XDG_CONFIG_HOME/cabal/config
export CABAL_DIR=$XDG_CACHE_HOME/cabal
# wget
export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc
# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# GunPG
export GNUPGHOME=$XDG_DATA_HOME/gnupg
# Java
export _JAVA_OPTIONS="-Duser.home=$XDG_DATA_HOME/java\
    -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export JDK_JAVA_OPTIONS=$_JAVA_OPTIONS
export JAVA_TOOL_OPTIONS=$_JAVA_OPTIONS
# Stack (Haskell)
export STACK_ROOT=$XDG_CONFIG_HOME/stack
# gradle
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
# go
export GOPATH=$XDG_DATA_HOME/go
# rust
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
# matlab
export MATLAB_LOG_DIR=/tmp
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
# cuda
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
# python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc
# conda
export CONDARC=$XDG_CONFIG_HOME/conda/condarc
