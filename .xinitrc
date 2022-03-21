# et keyboard layout to Swiss German
# setxkbmap de

# Load .Xresources file
xrdb -merge ~/.Xresources &
setxkbmap de &
feh --bg-fill /home/niklas/wall/joker.png &
xsetroot -cursor_name leftptr &
picom --daemon &
nm-applet &
xmodmap ~/.Xmodmap &
light -I &
light -N 2 &
dbus-launch --sh-syntax --exit-with-session; pulseaudio --kill; pipewire &
pasystray &
# xmodmap ~/.Xmodmap 

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
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec dbus-run-session i3
