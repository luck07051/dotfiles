# This Is My Configuration

# Installed

temp
```
bitwarden-cli
bitwarden-rofi

mpv
youtube-dl
```

Basic
```
base-devel
xorg xorg-xinit xorg-fonts-misc
xdg-user-dirs
alsl-utils
git openssh
(bluez bluez-utils)
```

Applications
```
alacritty
(qtile)
i3-gaps
sxhkd
yay i3ass
yay polybar
zsh
rofi
qutebrowswer
(conky)
(firefox)
```

Background app
```
picom
nitrogen
setxkbmap
yay -S colorscript
```

Commandline tool
```
ranger
sxiv
icdiff
wget
fzf
task
taskwarrior-tui
ffmpeg ffmpegthumbnailer
zathura zathura-pdf-mupdf
ueberzug
ncmpcpp
yay -S ncpamixer
```

Graphical app
```
thunar
pavucontrol
gimp
vlc
```

Rust
```
exa
htop
bat
procs
zoxide
starship # see .zshrc
```

Dependencie
```
# for rofi screenshot
xclip slop
yay -S ffcast
(npm  # node.js for vim-instant-markdown)
# for qtile 
pip install psutil
pip install dbus-next
# for taskwiki
sudo pip3 install tasklib
sudo pip3 install pynvim
# for bitwarden-rofi
jq
xdotool
# vim plug
yarn

```

Gtk theme
```
arc-gtk-theme
papirus-icon-theme
```

```
.dmenu
.xmonad xmonad-contrib xmobar
.tmux
```

Nvidea
```
nvidia
nvidia-utils
nvidia-settings
nvtop
```

Useless
```
screenfetch  
cmatrix  
```

Font
```
yay -S nerd-fonts-complete
yay -S (adobe-source-han-sans-otc-fonts)
yay -S (noto-fonts-cjk)
```






# a

### **[zplug](https://github.com/zplug/zplug)**
```
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
$ zplug install
```
```
yay -S zsh-syntax-highlighting-git
```


### **[vim-plug](https://github.com/junegunn/vim-plug)**
Vim
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs\  
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
If markdown-preview dont work, try this `:call mkdp#util#install()`

### ranger plugin
```
git clone git@github.com:jchook/ranger-zoxide.git ~/.config/ranger/plugins/zoxide
```

### yay
```
$ git clone https://aur.archlinux.org/yay-git.git
$ cd yay-git
$ makepkg -si
rm yay-git
```


### pip
` $ sudo pacman -S gcc python3-dev python-pip `


### changing default shell
```
$ chsh -l
$ chsh -s full-path-to-shell
```

### [dotfile](https://www.atlassian.com/git/tutorials/dotfiles)
```
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```


### nvidia ?
Not try yet
```
yay -S optimus-manager
sudo systemctl enable optimus-manager
vim /etc/optimus-manager/optimus-manager.conf
    startup-mode=nvidia
```



### [steam](https://www.chrisatmachine.com/Linux/08-steam-on-linux/)
If text is corrupt
` pacman -S  lib32-fontconfig ttf-liberation wqy-zenhei `


### git difftool
Add in .gitconfig
```
[diff]
    tool = icdiff
[difftool]
    prompt = false
[difftool "icdiff"]
    cmd = icdiff --line-numbers $LOCAL $REMOTE
```

### if default browser incorrect
try this 
```
xdg-mime default $(xdg-settings get default-web-browser) x-scheme-handler/https x-scheme-handler/http
```
