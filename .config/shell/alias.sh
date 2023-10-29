# Basic alias #

alias c='cd'
alias c.='cd ..'
alias c-='cd -'
alias c_='cd $_'
alias e='$EDITOR'
alias e.='$EDITOR .'
alias ls='ls -A'
alias ll='ls -Al'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias md='mkdir -pv'

alias emacs='emacsclient -c -a "emacs"'

# Life Quality #

alias n='$EDITOR $HOME/notes/index.md'
alias o='open'
alias os='open -s'
alias z='cd $(dirmark || echo $PWD)'
type fzf-fm >/dev/null && source fzf-fm && alias a='fzf_fm'

# Use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"
abbr cs='config status'
abbr ca='config add'

# Use doas instead of sudo
type doas >/dev/null && alias sudo='doas'

# Runit
abbr svs='doas sv status /run/runit/service/* | sed "s#/run/runit/service/##" | column -t -s:'
abbr svln='ls /etc/runit/sv/ | fzf | xargs -r -I{} doas ln -s /etc/runit/sv/{} /run/runit/service/'
abbr svrm='ls /run/runit/service/ | fzf | xargs -r -I{} doas rm /run/runit/service/{}'

# Yt dlp
abbr ytdm='yt-dlp --embed-thumbnail -f bestaudio -x --audio-format mp3'

# Docker
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias dp='docker ps'
alias ds='docker stats'

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcp='docker-compose pull'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'

# Calibre
toser(){
	scp -r "$@" "ui@ui.pi:~/data/downloads"
}

# Pacman
abbr dp='doas pacman'
abbr dps='doas pacman -S'

# Misc
abbr za='zathura'
abbr cr='cargo run'
abbr py='python3'
abbr rc='rsync -vhP'
abbr syncb='syncthing serve --browser-only'
abbr slidev='npx slidev'
abbr mi='doas make install clean'
abbr conrun='conda run --no-capture-output --name'
abbr fclist='fc-list : family | grep -i'

# API
abbr ipinfo='curl ipinfo.io'
abbr unitest='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr weather='curl https://wttr.in'


# Color and Readability #

# always human readable
alias df='df -h'
alias du='du -h'

# grep color
alias grep='grep --color=auto'

# ls
if type lsd >/dev/null; then
	alias ls='lsd -A --group-directories-first'
	alias ll='lsd -Al --group-directories-first'
elif type exa >/dev/null; then
	alias ls='exa -a --icons --group-directories-first'
	alias ll='exa -al --icons --group-directories-first --git -H'
else
	alias ls='ls -A --color=auto --group-directories-first'
	alias ll='ls -Al --color=auto --group-directories-first'
fi

# Using bat for help highlight
if [ "${0##*/}" == "zsh" ] && type bat >/dev/null; then
	alias -g -- -h='-h | bat --language=help --style=plain --wrap=never --paging=never'
	alias -g -- --help='--help | bat --language=help --style=plain --wrap=never --paging=never'
fi


# Fix Something #

# Change dir when left lf, and use given colors
lf() {
	source "$XDG_CONFIG_HOME/lf/colors"; \
		lf-imgview -last-dir-path="/tmp/lfcd"
	cd "$(cat /tmp/lfcd)"
}

# Dont generate ~/.conda/environments.txt file
conda() {
	"$HOME/.local/share/anaconda3/bin/conda" "$@"
	rm -f ~/.conda/environments.txt
	rmdir ~/.conda
}

# Fix config file path
[ -f "$XINITRC" ] && alias startx='startx \$XINITRC'
alias wget='wget --hsts-file="\$XDG_CACHE_HOME/wget-hsts"'
alias yarn='yarn --use-yarnrc "\$XDG_CONFIG_HOME/yarn/config"'
