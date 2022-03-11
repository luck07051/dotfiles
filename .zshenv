
# XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# export XDG_RUNTIME_DIR=

export PATH="${PATH}:$HOME/.local/bin"

# Other program path
# zsh
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZPLUG_HOME="$XDG_CONFIG_HOME"/zplug
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
# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# GunPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# Stack (Haskell)
export STACK_ROOT="$XDG_CONFIG_HOME"/stack
# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# rust#cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# go
export GOPATH="$XDG_DATA_HOME"/go


# Default App
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"

# Misc
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export HISTORY_IGNORE='(ls|la|ll|cd|cd -|cd ..|pwd|exit|reboot|history|q)'

# fzf setup
export FZF_DEFAULT_OPTS="--height 40% --color=pointer:5,gutter:-1 --info=hidden"
export FZF_DEFAULT_COMMAND="fd --hidden \
    --ignore-file ~/.config/fzf/ignore-file --type file"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

