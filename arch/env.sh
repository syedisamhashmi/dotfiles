#!/usr/bin/bash

# .bashrc location
export bashrc=$HOME/.bashrc

# Default editor
export EDITOR=/usr/bin/vim


if ! [ -d $repos_dir_default ]
then
	mkdir $repos_dir_default
fi

export config_files_directory=$script_path/conf
export packages_files_directory=$script_path/packages
export scripts_files_directory=$script_path/scripts

export PATH="$HOME/repos/aseprite/build/bin:$PATH"
