abbr c='cd'
abbr c.='cd ..'
abbr c-='cd -'
abbr c_='cd $_'
abbr z='cd $(dirmark)'
abbr o='open'
abbr e='$EDITOR'
abbr e.='$EDITOR .'
abbr n='$EDITOR $HOME/notes/index.md'

abbr dp='doas pacman'
abbr dps='doas pacman -S'

abbr cs='config status'
abbr ca='config add'

abbr df='df -h'
abbr du='du -h'
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
abbr mi='doas make install clean'
abbr clip='xclip -selection clipboard'

abbr svs='doas sv status /run/runit/service/* | sed "s#/run/runit/service/##" | column -t -s:'
abbr svln='doas ln -s /etc/runit/sv/"$(ls /etc/runit/sv/ | fzf)" /run/runit/service/'
abbr svrm='doas rm /run/runit/service/"$(ls /run/runit/service/ | fzf)"'

# Change dir when left lf, and use given colors
lf() {
  source "$XDG_CONFIG_HOME/lf/colors";\
    lf-imgview -last-dir-path="/tmp/lfcd"
  cd "$(cat /tmp/lfcd)"
}

type fzf-fm >/dev/null &&
  source fzf-fm

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
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd -A --group-directories-first'
  alias ll='lsd -Al --group-directories-first'
elif [ -x "$(command -v exa)" ]; then
  # alias ls='[ "$COLUMNS" -gt "80" ] && export COLUMNS=80;
  #   exa -a --icons --group-directories-first'
  alias ls='exa -a --icons --group-directories-first'
  alias ll='exa -al --icons --group-directories-first --git -H'
else
  alias ls='ls -A --color=auto --group-directories-first'
  alias ll='ls -Al --color=auto --group-directories-first'
fi

# use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"


# Fix config file path
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"
