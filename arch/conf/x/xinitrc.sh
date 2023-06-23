#!/usr/bin/bash
script_directory=$(dirname -- "$0")

echo $'Copying .xinitrc to $HOME/.xinitrc\n'
cp $script_directory/.xinitrc $HOME/.xinitrc

if ! [ -d "$HOME/.screenlayout" ];
then
  echo "Making directory $HOME/.screenlayout"
  mkdir $HOME/.screenlayout
fi
echo "Copying screen_layout_default.sh to $HOME/.screenlayout/screen_layout_default.sh"
cp $script_directory/screen_layout_default.sh $HOME/.screenlayout/screen_layout_default.sh
