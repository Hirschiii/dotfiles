if type "xrandr"; then
killall polybar
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [ $m = "HDMI2" ]; then
          MONITOR=$m polybar -q segund -c "~/.config/polybar/blocks/config.ini" &
          echo "hdmi2"
    else
    MONITOR=$m polybar -q main -c "~/.config/polybar/blocks/config.ini" &
      fi
  done
else
  polybar --reload example &
fi
