# et keyboard layout to Swiss German
setxkbmap de

# Load .Xresources file
xrdb -merge ~/.Xresources


# Statusbar loop
while true; do
   xsetroot -name "$(acpi -b) |  $( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &

# Set wallpaper
# feh --bg-scale ~/.xwallpaper-dwm.png

# Set WM name (for Java apps)

# Run dwm
exec /usr/local/bin/dwm
