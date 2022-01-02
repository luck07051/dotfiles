# Configuration

## Applications
#### Basic
> base-devel  
> git openssh  
> xorg xorg-xinit xorg-fonts-misc  
> alsl-utils  
> zsh  
> wget  
> .bluez bluez-utils  

#### Necessary
> qtile  
> alacritty  
> rofi  
> conky  
> firefox  
> 
> setxkbmap  
> picom  
> nitrogen  
> htop  
> exa  
> bat  
> xclip slop  # for rofi screenshot  
> npm  # node.js for vim markdown plug  
>   
> arc-gtk-theme  
> papirus-icon-theme  
> 
> .dmenu  
> .i3-gaps  
> .xmonad xmonad-contrib xmobar  
> .tmux  

#### Nece commend line program
> ranger  
> sxiv  
> ncmpcpp  

#### Graphical program
> pavucontrol  
> gimp  # ps, draw  


#### Nvidea
> nvidia  
> nvidia-utils   
> nvidia-settings  
> nvtop  


#### Useless
> screenfetch  
> cmatrix  



#### **[zplug](https://github.com/zplug/zplug)**
> ```
> $ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
> $ zplug install
> ```



#### **[vim-plug](https://github.com/junegunn/vim-plug)**
> ```
> $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs\  
>     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> :PlugInstall
> ```
> 
> setup markdown plug  
> ` $ [sudo] npm -g install instant-markdown-d `




#### yay
> Install yay
> ```
> $ git clone https://aur.archlinux.org/yay-git.git
> $ cd yay-git
> $ makepkg -si
> rm yay-git
> ```
> 
> nerd-fonts-complete  
> .adobe-source-han-sans-otc-fonts  
> .noto-fonts-cjk  
> zsh-syntax-highlighting-git  
> colorscript  
> ncpamixer  
> ffcast  # for screenshot  




#### pip
> Install pip  
> ` $ sudo pacman -S gcc python3-dev python-pip `
> 
> pip install psutil  # for qtile wigets  
> pip install dbus-next  

 


### Setup
#### changing your default shell
> ```
> $ chsh -l
> $ chsh -s full-path-to-shell
> ```

#### init dotfile
> ```
> git init --bare $HOME/dotfiles
> alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
> config config --local status.showUntrackedFiles no
> echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
> ```


#### nvidia ?
> not try yet
> ```
> yay -S optimus-manager
> sudo systemctl enable optimus-manager
> vim /etc/optimus-manager/optimus-manager.conf
>     startup-mode=nvidia
> ```


#### pluseaudio
> already in .config
> ```
> vim /etc/pulse/default.pa.d/load-audio-drivers-statically.pa
>     unload-module module-udev-detect
>     unload-module module-detect
>     load-module module-alsa-sink device=dmix
>     load-module module-alsa-source device=dsnoop
> ```


#### [steam](https://www.chrisatmachine.com/Linux/08-steam-on-linux/)
> if text is corrupt  
> ` pacman -S  lib32-fontconfig ttf-liberation wqy-zenhei `


#### wacom
> ` xsetwacom set "Wacom One by Wacom S Pen stylus" Area 15200 9500 0 4275` 
