#!/bin/bash

swaymsg -p output eDP-1 disable
swaymsg -p output DP-1 scale 2
swaymsg -p output HDMI-A-2 transform 270
