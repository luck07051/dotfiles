abbr c='cd'
abbr c.='cd ..'
abbr c-='cd -'
abbr z='cd $(dirmark)'
abbr o='open'
abbr e='$EDITOR'
abbr e.='$EDITOR .'
abbr n='$EDITOR $HOME/notes/index.md'

abbr dp='doas pacman'
abbr dps='doas pacman -S'

abbr cs='config status'
abbr ca='config add'

abbr cr='cargo run'
abbr tt='trans :zh-TW'
abbr za='zathura'
abbr py='python3'
abbr rc='rsync -vhP'
abbr syncb='syncthing serve --browser-only'
abbr nb='newsboat'
abbr slidev='npx slidev'
abbr lzg='lazygit'
abbr unitest='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr dmci='doas make clean install'

# Alias for open programs
ot() { setsid -f "$@" >/dev/null 2>&1 }
sa() { devour "$@" }

# Change dir when left lf, and use given colors
lf() {
  source "$XDG_CONFIG_HOME/lf/colors";\
    lf-imgview -last-dir-path="/tmp/lfcd"
  cd "$(cat /tmp/lfcd)"
}

# Confirm before overwriting something
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# grep color
alias grep='grep --color=auto'

# Use doas instead of sudo
[ -x "$(command -v doas)" ] && alias sudo='doas'

# Editor
[ -x "$(command -v nvim)" ] &&
  alias vim='nvim' vimdiff='nvim -d'

# ls
if [ -x "$(command -v exa)" ]; then
  # limit the columns to 80
  alias ls='[ "$COLUMNS" -gt "80" ] && export COLUMNS=80;
    exa -a --icons --group-directories-first'
  alias ll='exa -al --icons --group-directories-first --git -H'
else
  alias ls='ls -A color=auto --group-directories-first'
  alias ll='ls -Al color=auto --group-directories-first'
fi

# use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


# Fix config file path
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"


mkscript () {
  local file="${1}"

  [ -z "${file}" ] && { echo "Please supply a script name to create" >&2; return 1; }
  [ -f "${file}" ] && { echo "${file} already exists, aborting" >&2; return 1; }

  mkdir -p "$(dirname "${file}")"

  cat > "${file}" << EOF
#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

echo "hello world"
EOF

  chmod +x "${file}"

  "$EDITOR" "${file}"
}
