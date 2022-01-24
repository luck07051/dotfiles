# This Is My Configuration

# Installed

Basic
```
base-devel
xorg xorg-xinit xorg-fonts-misc
alsl-utils
xdg-user-dirs
git openssh
(bluez bluez-utils)
```

Applications
```
zsh
alacritty
qtile
rofi
firefox
(conky)
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

```

Gtk theme
```
arc-gtk-theme
papirus-icon-theme
```

```
.dmenu
.i3-gaps
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


### wacom
` xsetwacom set "Wacom One by Wacom S Pen stylus" Area 15200 9500 0 4275` 


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


### Color Scheme
'#1C1C1C', '#CF6868', '#A3BE8C', '#EBCB8B', '#81A1C1', '#FFB9DC', '#88C0D0', '#D0D0D0', 
'#585858', '#E59999', '#94C68B', '#FCDD9F', '#68ADCF', '#D5B0FF', '#87D1BC', '#808080'
