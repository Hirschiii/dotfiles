#!/bin/bash

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --vsync &

setxkbmap de &
clipmenud &
#bg
#nitrogen --restore &

#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &

xmodmap ~/.Xmodmap
