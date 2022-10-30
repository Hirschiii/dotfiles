#!/bin/bash

pkill nm-manager
pkill tint2 

tint2 & 
nm-applet &
feh --bg-fill ~/.dotfiles/.config/wall/super.jpg &
