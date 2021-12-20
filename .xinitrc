# et keyboard layout to Swiss German
setxkbmap de

# Load .Xresources file
xrdb -merge ~/.Xresources

lxsession &

picom &

xmodmap ~/.Xmodmap &

/usr/bin/emacs --daemon &

/home/niklas/scripts/dwmbar &

light -I &
light -N 2 &

dunst &

picom &

/home/niklas/scripts/dwmbar &
# Set wallpaper
feh --bg-fill /home/niklas/wall/boy.png
# Set WM name (for Java apps)

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Vars

export BROWSER = "qutebrowser" &
# Run dwm
exec /usr/local/bin/dwm
