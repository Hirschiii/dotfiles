function task_started {
	TASK="task"
	# Check if there are overdue tasks
	if [ "$($TASK +ACTIVE count rc.context:none)" -gt 0 ]; then
		echo """
		{
			\"name\": \"started_task\",
			\"full_text\": \" $($TASK rc.verbose: bar +ACTIVE limit:1) \",
			\"min_width\": \"100%\",
			\"urgent\": false,
			\"background\": \"#388E3C\",
			\"color\": \"#FFFFFF\",
			\"separator\": true,
			\"separator_block_width\": 12		
		},
		"""
	fi
}

function task_urgent {
	TASK="task"
	# Check if there are overdue tasks
	if [ "$($TASK +READY +OVERDUE count rc.context:none)" -gt 0 ]; then
		echo "true"
	else
		echo 'false'
	fi
}

function task_next {
	# Check if there are overdue tasks
		echo """
		{
			\"name\": \"task_next\",
			\"full_text\": \"| $(task rc.verbose: bar limit:1) |\",
			\"min_width\": \"100%\",
			\"urgent\": $(task_urgent),
		},
		"""
}


# Send the header so that swaybar knows we want to use JSON:
echo '{ "version": 1, "separator_symbol": "|" }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

# Now send blocks with information forever:
while :; do
    # Gather all the necessary information
    next_task=$(task rc.verbose: bar limit:1)
    inbox=$([[ $(task export inbox | jq) != "[]" ]] && echo "Inbox NOT empty |" || echo "")
    
    # Battery information
    battery_charge=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$battery_status" = "Discharging" ]; then
        battery_pluggedin=''
    else
        battery_pluggedin='⚡'
    fi

    # Network information
    network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
    if ! [ "$network" ]; then
        network_active="󰅛"
    else
        network_active="⇆"
    fi

    # Load average
    loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')

    # Date and time
    date_and_week=$(date "+%Y/%m/%d (w%-V)")
    current_time=$(date "+%H:%M")

    # Prepare the output in JSON format
    echo ",["
		task_started
		task_next
	echo "  {\"name\":\"task_inbox\",\"full_text\":\"$inbox\", \"min_width\": \"100%\", \"urgent\": false},"
    echo "  {\"name\":\"network_status\",\"full_text\":\"$network_active | LoadAvg $loadavg_5min | $battery_pluggedin $battery_charge% |\", \"min_width\": \"100%\", \"urgent\": false},"
    echo "  {\"name\":\"date_time\",\"full_text\":\"$date_and_week $current_time\", \"min_width\": \"100%\", \"urgent\": false}"
    echo "]"

    # Sleep for a specified interval before updating
    sleep 1
done
