#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Linking .vimrc to $HOME/.vimrc"
ln -s -f $script_directory/.vimrc $HOME/.vimrc

echo "Making vim directories..."

mkdir -p $HOME/.vim/pack/vendor/opt


plugin_directory=$script_directory/plugins

echo "Adding plugins from: $plugin_directory"
for plugin_script in $plugin_directory/*.sh
do
  echo $'Executing plugin script ' $plugin_script
  sh $plugin_script
done

echo $'\n'
