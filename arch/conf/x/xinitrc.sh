#!/usr/bin/bash

# Copy .xinitrc to user configuration directory.
script_directory=$(dirname -- "$0")

echo $'Copying .xinitrc to $HOME/.xinitrc\n'
cp $script_directory/.xinitrc $HOME/.xinitrc

