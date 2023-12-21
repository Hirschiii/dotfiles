# Change this according to your device
################
# Variables
################

# Next Task:

# OVERDUE='💀'
# DUETODAY='😱'
# DUETOMORROW='🗓️'
# URGENT='❗'
#
# function task_indikator {
# 	TASK="task"
# 	echo "test"
# 	if [ `$TASK +READY +OVERDUE count rc.context:none` => "0" ]; then
# 		echo "$OVERDUE"
# 	elif [ `$TASK +READY +TOMORROW count rc.context:none` => "0" ]; then 
# 		echo "$DUETOMORROW"
# 	elif [ `$TASK +READY +TODAY count rc.context:none` => "0" ]; then 
# 		echo "$DUETODAY"
# 	elif [ `$TASK +READY urgency.over:20 count rc.context:none` => "0" ]; then 
# 		echo "$URGENT"
# 	else
# 		echo '$'
# 	fi
# }

# next_task=$(task export next limit:1 | jq '.[] | "ID: \(.id) Desc: \(.description)"')
next_task=$(task rc.verbose: bar limit:1)

# Keyboard input name
keyboard_input_name="1:1:AT_Translated_Set_2_keyboard"

# Date and time
date_and_week=$(date "+%Y/%m/%d (w%-V)")
current_time=$(date "+%H:%M")

#############
# Commands
#############

# Battery or charger
# battery_charge=$(upower --show-info $(upower --enumerate | grep 'macsmc-battery') | egrep "percentage" | awk '{print $2}')
# battery_status=$(upower --show-info $(upower --enumerate | grep 'macsmc-battery') | egrep "state" | awk '{print $2}')
battery_charge=$(cat /sys/class/power_supply/macsmc-battery/capacity)
battery_status=$(cat /sys/class/power_supply/macsmc-battery/status)

# # Audio and multimedia
# audio_volume=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-volume)
# audio_is_muted=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-mute)
# media_artist=$(playerctl metadata artist)
# media_song=$(playerctl metadata title)
# player_status=$(playerctl status)

# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# interface_easyname grabs the "old" interface name before systemd renamed it
# interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
# ping=$(ping -c 1 www.google.es | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

# Others
# language=$(swaymsg -r -t get_inputs | awk '/1:1:AT_Translated_Set_2_keyboard/;/xkb_active_layout_name/' | grep -A1 '\b1:1:AT_Translated_Set_2_keyboard\b' | grep "xkb_active_layout_name" | awk -F '"' '{print $4}')
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')

position=$(curl https://am.i.mullvad.net/city)

# vpn=$(curl https://am.i.mullvad.net/connected)

# Removed weather because we are requesting it too many times to have a proper
# refresh on the bar
#weather=$(curl -Ss 'https://wttr.in/Pontevedra?0&T&Q&format=1')

if [ $battery_status = "Discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

if ! [ $network ]
then
   network_active="⛔"
else
   network_active="⇆"
fi

if [ $player_status = "Playing" ]
then
    song_status='▶'
elif [ $player_status = "Paused" ]
then
    song_status='⏸'
else
    song_status='⏹'
fi

if [ $audio_is_muted = "true" ]
then
    audio_active='🔇'
else
    audio_active='🔊'
fi

echo "$next_task | $position | $network_active | LoadAvg $loadavg_5min | $battery_pluggedin $battery_charge | $date_and_week $current_time"
