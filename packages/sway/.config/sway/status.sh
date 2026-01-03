#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.


bat_bg_color() {
	if [ $(cat $BAT/capacity) -gt 5 ];
	then
		echo ""
	 else
		 echo "#FF0000"
	fi
}

# next_task_formatted=$(task rc.verbose: bar limit:1)

next_task_formatted ()
{
	if [ "$(task +ACTIVE count rc.context:none)" -gt 0 ]; then
		echo -n "Active: $(task rc.verbose: bar +ACTIVE limit:1)"
	else
		echo -n "Next: $(task rc.verbose: bar limit:1)"
	fi
	
}



# Send the header so that swaybar knows we want to use JSON:
echo '{ "version": 1, "separator_symbol": "|" }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

while :; do
	echo ",["

	cpu_formatted=$(uptime | awk '{print $10}' | cut -d "," -f 1)
	mem_formatted=$(free -m | awk 'NR==2{printf "%.0f\n", $3*100/$2 }')
	disk_formatted=$(df -h | awk '$NF=="/"{printf "%s\n", $5}' )
	date_formatted=$(date "+%a %F %H:%M")
	lcd_formatted=$(($(brightnessctl g) * 100 / $(brightnessctl m)))
	bat_formatted=$(cat $BAT/capacity)
	vol_formatted=$(pamixer --get-volume)
	pwr_formatted=$(awk '{printf "%.2fW" ,$1*1e-6 }' $BAT/power_now)

	echo " {\"name\": \"task\", \"full_text\": \"$(next_task_formatted)\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"pwr\", \"full_text\": \"pwr $pwr_formatted\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"cpu\", \"full_text\": \"cpu $cpu_formatted\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"mem\", \"full_text\": \"mem $mem_formatted%\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"ssd\", \"full_text\": \"ssd $disk_formatted\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"bat\", \"full_text\": \"bat $bat_formatted%\", \"min_width\": \"100%\", \"background\":  \"$(bat_bg_color)\", \"urgent\": \"true\"},"
	echo " {\"name\": \"lcd\", \"full_text\": \"lcd $lcd_formatted%\", \"min_width\": \"100%\"},"
	echo " {\"name\": \"vol\", \"full_text\": \"vol $vol_formatted%    $date_formatted\", \"min_width\": \"100%\"},"

	echo "]"
	sleep 5;
done
