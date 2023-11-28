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

# Life Quality #

alias o='open'
alias os='open -s'
alias z='cd $(dirmark || echo $PWD)'
alias a='. fff'

# Use doas instead sudo
type doas >/dev/null 2>&1 && alias sudo='doas'

# Misc
alias za='zathura'
alias py='python3'
alias rc='rsync -vhP'
alias mi='doas make install clean'
alias conrun='conda run --no-capture-output --name'
alias fclist='fc-list : family | grep -i'
alias ytdm='yt-dlp --embed-thumbnail -f bestaudio -x --audio-format mp3'

# API
alias ipinfo='curl ipinfo.io'
alias weather='curl wttr.in'
alias unitest='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'

# Use bare Git repository to manage dotfiles
alias config="/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"
alias cs='config status'
alias ca='config add'

# Runit
alias svs='( cd /run/runit/service && doas sv status * ) | column -t -s:'
# TODO not POSIX compliance
alias svln='comm -13 <(ls /run/runit/service) <(ls /etc/runit/sv) | fzf |\
	xargs -r -I{} doas ln -s /etc/runit/sv/{} /run/runit/service/'
alias svrm='ls /run/runit/service/ | fzf |\
	xargs -r -I{} doas rm /run/runit/service/{}'

# Docker
alias lzd='docker run --rm -it\
	-v /var/run/docker.sock:/var/run/docker.sock\
	-v ~/.config/lazydocker:/.config/jesseduffield/lazydocker\
	lazyteam/lazydocker'
alias dp='docker ps'
alias ds='docker stats'

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcp='docker-compose pull'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'


# Color and Readability #

# always human readable
alias df='df -h'
alias du='du -h'

# grep color
alias grep='grep --color=auto'

# ls
if type lsd >/dev/null 2>&1; then
	alias ls='lsd -A --group-directories-first'
	alias ll='lsd -Al --group-directories-first'
	type tree >/dev/null 2>&1 || alias tree='lsd --tree'
elif type exa >/dev/null 2>&1; then
	alias ls='exa -a --icons --group-directories-first'
	alias ll='exa -al --icons --group-directories-first --git -H'
else
	alias ls='ls -A --color=auto --group-directories-first'
	alias ll='ls -Al --color=auto --group-directories-first'
fi

# Using bat for help highlight
if [ "${0##*/}" == "zsh" ] && type bat >/dev/null 2>&1; then
	alias -g -- -h='-h | bat --language=help --style=plain --wrap=never --paging=never'
	alias -g -- --help='--help | bat --language=help --style=plain --wrap=never --paging=never'
fi


# Fix Something #

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
