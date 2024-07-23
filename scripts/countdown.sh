#!/bin/bash

color_reset='\033[0m'
color_yellow='\033[1;33m'
color_cyan='\033[1;36m'
color_red='\033[1;31m'
color_green='\033[1;32m'

cursor_up='\e[1A\e[K'
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
