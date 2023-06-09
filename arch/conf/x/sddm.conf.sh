#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying sddm.conf to /etc/sddm.conf"
sudo cp $script_directory/sddm.conf /etc/sddm.conf

