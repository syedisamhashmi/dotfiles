#!/usr/bin/bash

script_directory=$(dirname -- "$0")

echo "Copying .vimrc to $HOME/.vimrc"
cp $script_directory/.vimrc $HOME/.vimrc

echo "Creating vim directories..."
mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/backup 
mkdir -p ~/.vim/colors 
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/backup 
