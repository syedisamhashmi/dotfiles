[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources 
numlockx &
exec $HOME/.screenlayout/screen_layout_default.sh &
exec i3
