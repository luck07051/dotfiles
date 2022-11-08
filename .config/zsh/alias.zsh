abbr sp="sudo pacman"
abbr sps="sudo pacman -S"

abbr v="vim"
abbr ww="vim ~/vimwiki/index.md"
abbr n="vim ~/notes/note.norg"
abbr m="vim ~/memo.md"

abbr c="config"
abbr cs="config status"
abbr ca="config add"

abbr cr="cargo run"
abbr tt="trans :zh-TW"
abbr py="python3"
abbr rc='rsync -vhP'


# Confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"

# Editor
[ -x "$(command -v nvim)" ] &&
  alias vim="nvim" vimdiff="nvim -d"

# ls
if [ -x "$(command -v exa)" ]; then
  alias ls='[ "$COLUMNS" -gt "80" ] && export COLUMNS=80;
    exa -a --icons --group-directories-first'
  alias ll="exa -al --icons --group-directories-first --git -H"
else
  alias ls='ls -A color=auto --group-directories-first'
  alias ll='ls -Al color=auto --group-directories-first'
fi

# use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# cd
alias z-='z -'
alias z.='z ..'

# grep
alias grep="grep --color=auto"

# Fix config file path
# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"
