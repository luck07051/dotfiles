
# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# export XDG_RUNTIME_DIR=

export PATH="${PATH}:$HOME/.local/bin"
export PATH="${PATH}:$HOME/.config/rofi/scripts"

# Other program path
# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
# X11
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export XAUTHORITY=$XDG_CONFIG_HOME/X11/xauthority
# cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
# less hittory
export LESSHISTFILE=-
# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
