#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying client.conf to $HOME/.pulse/client.conf"
cp $script_directory/client.conf  $HOME/.pulse/client.conf

