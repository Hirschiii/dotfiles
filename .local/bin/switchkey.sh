#!/bin/env bash

now=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
nvim_config="$HOME/.config/nvim/lua/user/init.lua"

if [ "$now" = "de" ];then
    setxkbmap us -variant colemak_dh
    sed -i 's/local layout=".*"/local layout="us"/' $nvim_config
else
    setxkbmap de
    sed -i 's/local layout=".*"/local layout="de"/' $nvim_config
fi

xmodmap ~/.Xmodmap
