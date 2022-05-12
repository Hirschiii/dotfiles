#!/bin/bash

# compositor
# killall picom
# while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
# picom --config ~/.config/picom/picom.conf --vsync &
compton --vsync &
feh --bg-fill ~/.dotfiles/wall/all.png &

# bash ~/scripts/launche_poly.sh &
xrdb -merge ~/.Xresources &
clipmenud &
#bg
#nitrogen --restore &

pkill pasystray &
pkill nm-applet &


#sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &

xmodmap /home/niklas/.dotfiles/.Xmodmap &

echo "before"
 if pgrep -x "conky"
    then killall conky
        wait 10
        conky -d -c ~/.config/conky/.conkyrc &
    else 
        conky -d -c ~/.config/conky/.conkyrc &
fi
echo "after"

pasystray &
nm-applet &
autotiling &
