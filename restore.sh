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
echo -e "$color_cyan copying config files... $color_reset"
mkdir -p /home/$(whoami)/.config/hypr
cp $USERCONFIG_DIR/hyprland.conf /home/$(whoami)/.config/hypr/hyprland.conf