# Configuration

## Applications
#### Basic
base-devel  
xorg xorg-xinit xorg-fonts-misc  
alsl-utils  
xdg-user-dirs  
git openssh  
bluez bluez-utils  

#### Necessary
qtile  
zsh  
alacritty  
rofi  
conky  
firefox  
 
setxkbmap  
picom  
nitrogen  

fzf  
icdiff  
wget  

exa  
htop  
bat  
procs  
zoxide  

xclip slop  # for rofi screenshot  
npm  # node.js for vim markdown plug  
 
arc-gtk-theme  
papirus-icon-theme  
 
.dmenu  
.i3-gaps  
.xmonad xmonad-contrib xmobar  
.tmux  

#### Nece commend line program
ranger  
sxiv  
ncmpcpp  

#### Graphical program
pavucontrol  
gimp  # ps, draw  


#### Nvidea
nvidia  
nvidia-utils  
nvidia-settings  
nvtop  


#### Useless
screenfetch  
cmatrix  



#### **[zplug](https://github.com/zplug/zplug)**
```
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
$ zplug install
```



#### **[vim-plug](https://github.com/junegunn/vim-plug)**
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs\  
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
:PlugInstall
```
Neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

if markdown-preview dont work, try this 
`:call mkdp#util#install()`




#### yay
Install yay
```
$ git clone https://aur.archlinux.org/yay-git.git
$ cd yay-git
$ makepkg -si
rm yay-git
```

nerd-fonts-complete  
.adobe-source-han-sans-otc-fonts  
.noto-fonts-cjk  
zsh-syntax-highlighting-git  
colorscript  
ncpamixer  
ffcast  # for screenshot  
neovide




#### pip
Install pip  
` $ sudo pacman -S gcc python3-dev python-pip `
  
pip install psutil  # for qtile wigets  
pip install dbus-next  


### Setup
#### changing your default shell
```
$ chsh -l
$ chsh -s full-path-to-shell
```

#### init dotfile
```
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```


#### nvidia ?
not try yet
```
yay -S optimus-manager
sudo systemctl enable optimus-manager
vim /etc/optimus-manager/optimus-manager.conf
    startup-mode=nvidia
```


#### pluseaudio
already in .config
```
vim /etc/pulse/default.pa.d/load-audio-drivers-statically.pa
    unload-module module-udev-detect
    unload-module module-detect
    load-module module-alsa-sink device=dmix
    load-module module-alsa-source device=dsnoop
```


#### [steam](https://www.chrisatmachine.com/Linux/08-steam-on-linux/)
if text is corrupt  
` pacman -S  lib32-fontconfig ttf-liberation wqy-zenhei `


#### wacom
` xsetwacom set "Wacom One by Wacom S Pen stylus" Area 15200 9500 0 4275` 

#### git difftool
add in .gitconfig
```
[diff]
    tool = icdiff
[difftool]
    prompt = false
[difftool "icdiff"]
    cmd = icdiff --line-numbers $LOCAL $REMOTE
```



#### Color Scheme
'#1C1C1C', '#CF6868', '#A3BE8C', '#EBCB8B', '#81A1C1', '#FFB9DC', '#88C0D0', '#D0D0D0', 
'#585858', '#E59999', '#94C68B', '#FCDD9F', '#68ADCF', '#D5B0FF', '#87D1BC', '#808080'
