#==================== XDG Paths ====================#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mu"
export XDG_PICTURES_DIR="$HOME/img"
export XDG_VIDEOS_DIR="$HOME/vid"

# export XDG_RUNTIME_DIR=

#==================== Bin Paths ====================#
# Add ~/.local/bin and it's subdir to path
export PATH="${PATH}:$(find $XDG_BIN_HOME -type d -printf "%p:" | sed -e 's/:$//g')"

[ -f $XDG_DATA_HOME/cargo/env ] && . $XDG_DATA_HOME/cargo/env


#==================== Main ====================#
export WM='dwm'
export EDITOR='nvim'
export TERMINAL='alacritty'
export TERM='alacritty'
export BROWSER='firefox'

export LANG='en_US.UTF-8'

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$XDG_CACHE_HOME/history"
export HISTORY_IGNORE="(ls|cd|history|lf|exit|reboot)"

# FZF
export FZF_DEFAULT_OPTS="--bind ctrl-j:down,ctrl-k:up --height 40% \
    --color=pointer:5,gutter:-1,prompt:15 --no-separator --info=default"
export FZF_DEFAULT_COMMAND="fd -HL --exclude '.git' --type file"


#==================== Lets Paths Right ====================#
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
export test5="test"
# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
