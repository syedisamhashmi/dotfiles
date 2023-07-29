([[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources) &
numlockx &
exec /usr/share/monitor_layout_default.sh &
exec i3
