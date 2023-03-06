#!/bin/bash

pkill nm-applet

# nm-applet &
~/.config/polybar/launch.sh &
# feh --bg-fill ~/.dotfiles/.config/wall/larry.png &
feh --bg-fill --randomize ~/.config/wall/gradient.jpg &
conky -c $HOME/.config/conky/conky_task_progress.lua &
# DISPLAY=:0 feh --bg-center ~/.config/wall/colemak.png
