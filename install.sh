#!/bin/bash
color_reset='\033[0m'
color_yellow='\033[1;33m'
color_cyan='\033[1;36m'
color_red='\033[1;31m'
color_green='\033[1;32m'

cursor_up='\e[1A\e[K'

PROJECT_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SYSCONFIG_DIR=$PROJECT_ROOT/config/sys
USERCONFIG_DIR=$PROJECT_ROOT/config/home
SCRIPTS_DIR=$PROJECT_ROOT/scripts

echo -e "$color_yellow Warning: this script uses sudo as root! $color_reset"
echo -e "$color_cyan INFO: every file modified is backed up as .bak $color_reset"
echo -e "please select config"
echo "[1] hyprluma"
echo "[2] hyprluma-nvidia (coming soon)"
echo "your_number?"
read config_type


isnum='^[0-9]+$'
if  [[ $config_type =~ $isnum ]]; then 
	if [[ $config_type -gt 2 ]]; then
	    echo -e "$color_red invalid config$color_reset"
	    exit 1
	fi
else

	    echo -e "$color_red invalid character$color_reset"
	    exit 1
fi

bash $SCRIPTS_DIR/countdown.sh
bash $SCRIPTS_DIR/bootstrap.sh $PROJECT_ROOT

echo -e "$color_cyan copying config files... $color_reset"
mkdir -p /home/$(whoami)/.config/hypr
cp $USERCONFIG_DIR/hyprland.conf /home/$(whoami)/.config/hypr/hyprland.conf