([[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources) &
numlockx &

exec /usr/share/monitor_layout_default.sh &

exec /home/prosdkr/repos/dotfiles/arch/conf/liquidctl/liquidctl.sh 
exec i3
