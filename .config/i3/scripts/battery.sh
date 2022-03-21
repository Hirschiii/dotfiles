#!/bin/bash

BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)
STR=""
RCH=""

if [ $BAT -gt 90 ]
then
    STR=" "
elif [ $BAT -gt 75 ]
then
    STR=" "
elif [ $BAT -gt 50 ]
then
    STR=" "
elif [ $BAT -gt 25 ]
then
    STR=" "
elif [ $BAT -gt 10 ]
then
    STR=" "
fi

if [ $STAT = "Charging " ]
then
    RCH="Charching "
else
    RCH=""
fi

echo -e " $RCH $STR $BAT %"
