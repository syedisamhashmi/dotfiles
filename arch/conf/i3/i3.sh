#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying config to $HOME/.config/i3/config"
cp $script_directory/config  $HOME/.config/i3/config 
