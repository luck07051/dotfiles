alias c='cd'
alias c.='cd ..'
alias c-='cd -'
alias c_='cd $_'
alias z='cd $(dirmark || echo $PWD)'
alias o='open'
alias os='open -s'
alias e='$EDITOR'
alias e.='$EDITOR .'
alias n='$EDITOR $HOME/notes/index.md'

abbr dp='doas pacman'
abbr dps='doas pacman -S'

abbr cs='config status'
abbr ca='config add'

abbr za='zathura'
abbr cr='cargo run'
abbr py='python3'
abbr rc='rsync -vhP'
abbr syncb='syncthing serve --browser-only'
abbr slidev='npx slidev'
abbr lzg='lazygit'
abbr lzd='lazydocker'
abbr unitest='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr weather='curl https://wttr.in'
abbr mi='doas make install clean'
abbr conrun='conda run --no-capture-output --name'
abbr fclist='fc-list : family | grep -i'

abbr svs='doas sv status /run/runit/service/* | sed "s#/run/runit/service/##" | column -t -s:'
abbr svln='ls /etc/runit/sv/ | fzf | xargs -r -I{} doas ln -s /etc/runit/sv/{} /run/runit/service/'
abbr svrm='ls /run/runit/service/ | fzf | xargs -r -I{} doas rm /run/runit/service/{}'

# Change dir when left lf, and use given colors
lf() {
  source "$XDG_CONFIG_HOME/lf/colors";\
    lf-imgview -last-dir-path="/tmp/lfcd"
  cd "$(cat /tmp/lfcd)"
}
# Dont gen ~/.conda/environments.txt file
conda() {
  /usr/bin/conda "$@"
  rm -f ~/.conda/environments.txt
  rm -fd ~/.conda
}

# use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

type fzf-fm >/dev/null && source fzf-fm

# Confirm before overwriting something
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# grep color
alias grep='grep --color=auto'

# always human readable
alias df='df -h'
alias du='du -h'

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
  alias ls='exa -a --icons --group-directories-first'
  alias ll='exa -al --icons --group-directories-first --git -H'
else
  alias ls='ls -A --color=auto --group-directories-first'
  alias ll='ls -Al --color=auto --group-directories-first'
fi


# Fix config file path
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"
