#!/usr/bin/zsh

# ACTION NECESSARY - Set path to repo containing my dotfiles.
export REPO_PATH="$HOME/vs/dotfiles";
# ACTION NECESSARY - Set path to proper OS.
export SPECIFIC_OS_FOLDER="$REPO_PATH/osx";

# Loads all the split files in the osx folder.
for file in "${SPECIFIC_OS_FOLDER}/"*.*; do
  source "${file}"
done
unset file
unset REPO_PATH
unset SPECIFIC_OS_FOLDER
