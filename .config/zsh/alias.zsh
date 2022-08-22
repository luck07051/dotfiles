# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

# Confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"

# Editor
# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && \
  alias vim="nvim" vimdiff="nvim -d"
alias v="$EDITOR"
alias ww="vim ~/vimwiki/index.md"
alias n="vim ~/notes/note.norg"

# ls
alias ls="exa -al --icons --group-directories-first --color=auto"
alias l="exa --icons --group-directories-first --color=auto"

# git
# use bare Git repository to manager my dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias c="config"
alias cs="config status"

# cd
alias z-='z -'
alias z.='z ..'

# cargo
alias cr="cargo run"

# trans
alias tt="trans :zh-TW"

# grep
alias grep="grep --color=auto"

# Fix config file path
# wget
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
# yarn
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"
