#!/bin/bash

cp -f $(find ~/.config/wall/. -type f | shuf -n1) ~/.cache/wallpaper && swaymsg output "*" background ~/.cache/wallpaper fill
