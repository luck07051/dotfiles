
#==================== XDG Paths ====================#
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# export XDG_RUNTIME_DIR=

#==================== Bin Paths ====================#
# Add ~/.local/bin and its subdir to path
export PATH="${PATH}:$(find $HOME/.local/bin -type d -printf "%p:" | sed -e 's/:$//g')"


#==================== Let Paths Right ====================#
# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export ZPLUG_HOME="$XDG_CONFIG_HOME"/zplug
# X11
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export XAUTHORITY=$XDG_CONFIG_HOME/X11/xauthority
# cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# GunPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# Java
export _JAVA_OPTIONS="-Duser.home=$XDG_DATA_HOME/java\
    -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export JDK_JAVA_OPTIONS="-Duser.home=$XDG_DATA_HOME/java\
    -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export JAVA_TOOL_OPTIONS="-Duser.home=$XDG_DATA_HOME/java\
    -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
# Stack (Haskell)
export STACK_ROOT="$XDG_CONFIG_HOME"/stack
# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# go
export GOPATH="$XDG_DATA_HOME"/go
# matlab
export MATLAB_LOG_DIR=/tmp
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
# rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup


#==================== Default App ====================#
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

#==================== Misc ====================#
export TERM="xterm-256color"
export LANG=en_US.UTF-8

# input method
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# lf
source "$XDG_CONFIG_HOME/lf/colors"

# fix matlab
export _JAVA_AWT_WM_NONREPARENTING=1

. "/home/ui/.local/share/cargo/env"

