#!/bin/sh
while :; do
  while IFS='
' read -r line; do
  if test "0" = "$line"; then
    # ydotool click --delay 120 1 > /dev/null 2>&1
	# doas ydotool click 0xC0 > /dev/null 2>&1
	doas ydotool click -D 60 0xC0 > /dev/null 2>&1
  fi
  done < "/tmp/click"
done
