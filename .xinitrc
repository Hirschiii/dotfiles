# et keyboard layout to Swiss German
setxkbmap de

# Load .Xresources file
xrdb -merge ~/.Xresources

lxsession &

picom &

xmodmap ~/.Xmodmap &

/usr/bin/emacs --daemon &

light -I &
light -N 2 &

dunst &

picom &

# Set wallpaper
feh --bg-fill /home/niklas/wall/mountains.png
# Set WM name (for Java apps)

# Vars

export BROWSER = "qutebrowser" &
# Run dwm
exec /usr/local/bin/dwm
