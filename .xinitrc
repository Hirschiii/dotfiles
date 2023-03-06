#!/bin/sh

xsetroot -cursor_name leftptr &
picom --daemon &

light -I &
light -N 2 &

/usr/bin/gentoo-pipewire-launcher &

exec dbus-launch --exit-with-session herbstluftwm
