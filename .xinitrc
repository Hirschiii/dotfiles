# et keyboard layout to Swiss German
# setxkbmap de

# Load .Xresources file
xrdb -merge ~/.Xresources

# xmodmap ~/.Xmodmap &

#xrandr --setprovideroutputsource modesetting NVIDIA-0 &
#xrandr --auto &

# light -I &
# light -N 2 &

# picom &
# Set wallpaper
# feh --bg-fill /home/niklas/wall/gen4k.jpg
# /usr/bin/emacs -daemon &
# Set WM name (for Java apps)

# Run dwm
#exec dbus-run-session /usr/local/bin/dwm
exec dbus-run-session bspwm
