#!/bin/bash

swaymsg -p output eDP-1 disable
swaymsg -p output DP-1 pos 0 0 res 3840x2160 scale 2
swaymsg -p output HDMI-A-2 pos 3840 0 transform 270 scale 1.35
