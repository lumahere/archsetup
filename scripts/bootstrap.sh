#!/bin/bash

color_reset='\033[0m'
color_yellow='\033[1;33m'
color_cyan='\033[1;36m'
color_red='\033[1;31m'
color_green='\033[1;32m'

cursor_up='\e[1A\e[K'

PROJECT_ROOT=$1
SYSCONFIG_DIR=$PROJECT_ROOT/config/sys
USERCONFIG_DIR=$PROJECT_ROOT/config/home
SCRIPTS_DIR=$PROJECT_ROOT/scripts

echo -e "$color_cyan modifying pacman.conf... $color_reset"
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp $SYSCONFIG_DIR/pacman.conf /etc/pacman.conf

echo -e "$color_cyan updating package list... $color_reset"

sudo pacman -Sy > /dev/null

echo -e "$color_cyan getting git... $color_reset"
yes | sudo pacman -S git > /dev/null

mkdir -p $PROJECT_ROOT/clones
echo -e "$color_cyan installing yay aur helper... $color_reset"

if [ ! -d $PROJECT_ROOT/clones/yay ]; then
    git clone https://aur.archlinux.org/yay-bin $PROJECT_ROOT/clones/yay > /dev/null
    cd $PROJECT_ROOT/clones/yay && makepkg -si
fi

echo -e "$color_cyan downloading essential packages, please check before continuing $color_reset"
echo ""

    yay -S $( < $PROJECT_ROOT/corepkgs.ls) 

echo -e "$color_cyan if you're using a rotateable screen, sddm and hyprland might set the initial rotation wrong! $color_reset"
echo -e "$color_yellow are you using a rotatable screen?[y/n]"
read is_rotate

if [[ "$is_rotate" == "y" ]]; then
    echo "rotate (n)one (l)eft (r)ight"
    read rotate_orient

    echo -e "$color_cyan setting up SDDM...  $color_reset"
    sudo mkdir -p /etc/sddm.conf.d
    sudo sh -c 'echo -e "[X11]\nDisplayCommand=/usr/share/sddm/scripts/Xsetup" > /etc/sddm.conf.d/login.conf'
    if [[ "$rotate_orient" == "l" ]]; then
    sudo sh -c 'echo -e "#!/bin/sh \n xrandr --output DSI-1 --rotate left"  > /usr/share/sddm/scripts/Xsetup' 
    elif [[ "$rotate_orient" == "r" ]]; then
    sudo sh -c 'echo -e "#!/bin/sh \n xrandr --output DSI-1 --rotate right" > /usr/share/sddm/scripts/Xsetup'
    else 
    echo -e "$color_cyan Not rotating screen... $color_reset"
    fi 
fi


echo -e "$color_cyan activating SDDM... $color_reset"
sudo systemctl enable sddm