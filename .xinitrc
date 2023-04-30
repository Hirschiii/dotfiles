#!/bin/sh

xsetroot -cursor_name leftptr &

light -I &
light -N 2 &

/usr/bin/gentoo-pipewire-launcher &

exec dbus-launch --exit-with-session herbstluftwm
