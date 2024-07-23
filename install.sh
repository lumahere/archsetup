#!/bin/bash
color_reset='\033[0m'
color_yellow='\033[1;33m'
color_cyan='\033[1;36m'
color_red='\033[1;31m'
color_green='\033[1;32m'

cursor_up='\e[1A\e[K'

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo -e "$color_yellow Warning: this script uses sudo as root! $color_reset"
echo -e "$color_cyan INFO: every file modified is backed up as .bak $color_reset"

sleep 0.2
echo -e "$color_green starting in 3$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3.$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2.$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2..$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2..1$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2..1.$color_reset"
sleep 0.2
echo -e "$color_green$cursor_up starting in 3..2..1..$color_reset"
sleep 0.2
echo ""

echo -e "$color_cyan modifying pacman.conf... $color_reset"
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp $SCRIPT_DIR/configs/pacman.conf /etc/pacman.conf

echo -e "$color_cyan updating package list... $color_reset"


sudo pacman -Sy