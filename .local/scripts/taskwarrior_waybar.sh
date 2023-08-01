#!/bin/env bash

# Outputs wether the Active task, or the next Task and ID
#
# Dependencies:
# - jq
# - taskwarrior

# echo $task_active
#
help () {
    echo """
 Outputs wether the Active task, or the next Task and ID

 Dependencies:
 - jq
 - taskwarrior
    """
}

task_active=$(task export active)
get_id=true
get_desc=true
get_stat=true
output=""
# If there are active tasks
get_infos () {
    output='{"text":"'
    if task export active | jq -e ". == []" > /dev/null
    then
        if $get_stat
        then
            output="${output}Next"
        fi
        if $get_id
        then
            output="$output $(task export next | jq '.[0].id')"
        fi

        if $get_desc
        then
            output="$output $(task export next | jq '.[0].description' | sed -s "s/\"//g")"
        fi
        output="$output\","
    else
        if $get_stat
        then
            output="${output}Active"
        fi
        if $get_id
        then
            output="$output $(task export active | jq '.[0].id')"
        fi
        if $get_desc
        then
            output="$output $(task export active | jq '.[0].description' | sed -s "s/\"//g")"
        fi
        output="$output\",\"class\":\"active\","
    fi
    tooltip=$(task minimal | tail -n +4 | sed -s "s/\$/\\r/g")
    output="$output \"tooltip\":\"$tooltip\"}"
    echo $output
}

get_infos
