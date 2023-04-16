#!/bin/bash

# $1 - the class name
# $2 - the image name

# Hold onto my previous workspace so I know where to return to afterwards
PREVWORKSPACE="$(herbstclient tag_status | sed "s/.*#\(.\).*/\1/")"
# Get where the image is going to be
IMAGEPATH=~/Hirschiii.github.io/notes/$1/$2

# Copy the template file into the correct directory
cp ~/.config/inkscape-figures/template.svg $IMAGEPATH.svg
# Goto another workspace (so that the text editor isn't on screen anymore)
herbstclient use_index +1

# Run Castel's inkscape-shortcut-manager and save its process ID
python3 ~/.config/inkscape-shortcut-manager/inkscape-shortcut-manager/main.py & echo "$!" > /tmp/ink.pid

# Run inkscape
echo "before"
inkscape $IMAGEPATH.svg

# Wait until inkscape is closed

for i in $n_procs; do
    ./procs[${i}] &
    pids[${i}]=$!
done

echo "wait"
echo $(date)
# wait for all pids
for pid in ${pids[*]}; do
    wait $pid
done
echo $(date)

# Convert the created svg file to a png
inkscape --export-type="png" --export-dpi=1000 $IMAGEPATH.svg 

# Kill inkscape-shortcut-manager
kill -9 $(cat /tmp/ink.pid) > /dev/null

# Return to previous workspace
echo "$PREVWORKSPACE"
herbstclient use_index $(expr $PREVWORKSPACE - 1)

# Remove temporary file used to hold process ID
# rm /tmp/ink.pid
