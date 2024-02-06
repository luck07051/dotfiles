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
export XDG_BOOKMARK_DIR="$HOME/bm"

#==================== Bin Paths ====================#
# Add ~/.local/bin and it's subdir to path
PATH="${PATH}$(find "$XDG_BIN_HOME" -type d ! -path '*.git*' ! -path '*__pycache__*' -printf ':%p')"
export PATH

export PATH="${PATH}:$XDG_DATA_HOME/python/bin"
export PATH="${PATH}:$XDG_DATA_HOME/anaconda3/bin"
export PATH="${PATH}:$XDG_DATA_HOME/cargo/bin"

#==================== Main ====================#
export WM='dwm'
export TERMINAL='st'
export BROWSER='librewolf'
export EDITOR='nvim'
export SHELL='/bin/bash'
export PKGMAN='paru'
export DMENU='fmenu'

type nvim >/dev/null && export MANPAGER='nvim +Man!'

export LANG='en_US.UTF-8'

# Shell
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="$XDG_CACHE_HOME/history"
export HISTORY_IGNORE="?:??"  # ignore one or two char command
export HISTCONTROL=ignoreboth:erasedups

# Fzf Config
export FZF_DEFAULT_OPTS='
	--height 50%
	--color=pointer:5,gutter:-1
	--no-separator
	--info=inline
	--reverse
	--bind=tab:down
	'
export FZF_DEFAULT_COMMAND="fd -HL --exclude '.git' --type file"


#==================== Lets Paths Right ====================#
# X11
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
#export XSERVERRC=$XDG_CONFIG_HOME/X11/xserverrc
export XAUTHORITY=$XDG_CONFIG_HOME/X11/xauthority
# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
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
export _JAVA_OPTIONS="-Duser.home=$XDG_DATA_HOME/java -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
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
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
# conda
export CONDARC=$XDG_CONFIG_HOME/conda/condarc
# docker
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
# pylint
export PYLINTHOME=$XDG_CACHE_HOME/pylint
export PYLINTRC=$XDG_CONFIG_HOME/pylint/pylintrc
# conda
export CONDA_BLD_PATH=$XDG_DATA_HOME/conda/conda-bld
export CONDA_ENVS_PATH=$XDG_DATA_HOME/conda/envs
export CONDA_PKGS_DIRS=$XDG_CACHE_HOME/conda/pkgs
# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages


#==================== Startup programs ====================#
run(){
	if type "$1" >/dev/null && ! pidof -q "$1"; then
		"$@" &
	fi
}
# Run these if you login tty1
if [ "${XDG_VTNR}" -eq 1 ]; then
	# audio
	run start-pipewire

	run syncthing serve --no-browser --no-default-folder >/dev/null

	run /bin/emacs --daemon

	if [ -z "${DISPLAY}" ]; then
		startx "$XINITRC"
		# river
	fi
fi
