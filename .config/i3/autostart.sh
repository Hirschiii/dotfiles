#!/bin/bash

# compositor
# killall picom
# while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
# picom --config ~/.config/picom/picom.conf --vsync &
# compton --vsync &
picom &
feh --bg-fill ~/.dotfiles/wall/back_to_everfrost.png &

# bash ~/scripts/launche_poly.sh &
xrdb -merge ~/.Xresources &
clipmenud &
#bg
#nitrogen --restore &

#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &

xmodmap /home/niklas/.dotfiles/.Xmodmap &

autotiling &
