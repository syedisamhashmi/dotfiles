#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Linking lightdm.conf to /etc/lightdm/lightdm.conf"
sudo ln -s -f $script_directory/lightdm.conf  /etc/lightdm/lightdm.conf

echo "Linking monitor_layout_default.sh to /usr/share/monitor_layout_default.sh"
sudo ln -s -f $script_directory/monitor_layout_default.sh /usr/share/monitor_layout_default.sh


echo "Linking Lightdm-gtk-greeter.conf to /etc/lightdm/lightdm-gtk-greeter.conf"
sudo ln -s -f $script_directory/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
