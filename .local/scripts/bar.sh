#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

warning=#cc3300

interval=0

# load colors
. ~/Downloads/chadwm/scripts/bar_themes/catppuccin

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
  # updates=$(sudo xbps-install -un | wc -l) # void
  updates=$(PRINT_COUNT_ALWAYS=never eix -uc --format="<name>\n" | wc -l)
  # updates=$(pacman -Qu | wc -l)   # arch
  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

  if [ -z "$updates" ]; then
    printf "^c$green^  Fully Updated"
  else
    printf "^c$green^ $updates"" updates"
  fi
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  printf "^b$black^"
  if [ $get_capacity -lt 10 ]; then
    case "$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)" in
      Full) printf "^c$red^ ^b$warning^   $get_capacity" ;;
      Charging) printf "^c$red^   $get_capacity" ;;
      Discharging) printf "^c$red^ ^b$warning^   $get_capacity" ;;
      *) printf "^c$blue^   $get_capacity" ;;
    esac
  else
    case "$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)" in
      Full) printf "^c$blue^    " ;;
      Charging) printf "^c$blue^  $get_capacity" ;;
      Discharging) printf "^c$blue^  $get_capacity" ;;
      Not\ charging) printf "^c$blue^  $get_capacity" ;;
      *) printf "^c$blue^   $get_capacity" ;;
    esac
  fi
}

brightness() {
  printf "^c$red^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Speicher/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^  ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^  ^d^%s" " ^c$blue^Disconnected" ;;
  esac
}

clock() {
	printf "^c$black^ ^b$darkblue^  "
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
