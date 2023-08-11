#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying config to $HOME/.config/i3status/config"
mkdir -p $HOME/.config/i3status
ln -sf $script_directory/config  $HOME/.config/i3status/config 
ln -sf $script_directory/uptime.sh $HOME/.config/i3status/uptime.sh
