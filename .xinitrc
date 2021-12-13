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

/home/niklas/.dotfiles/autostart.sh &

# Set wallpaper
feh --bg-fill /home/niklas/wall/boy.png
# Set WM name (for Java apps)

# Run dwm
exec /usr/local/bin/dwm
