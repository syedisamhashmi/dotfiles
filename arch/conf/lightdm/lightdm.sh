#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying lightdm.conf to /etc/lightdm/lightdm.conf"
sudo cp $script_directory/lightdm.conf  /etc/lightdm/lightdm.conf

echo "Copying monitor_layout_default.sh to /usr/share/monitor_layout_default.sh"
sudo cp $script_directory/monitor_layout_default.sh /usr/share/monitor_layout_default.sh


echo "Copying lightdm-gtk-greeter.conf to /etc/lightdm/lightdm-gtk-greeter.conf"
sudo cp $script_directory/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
