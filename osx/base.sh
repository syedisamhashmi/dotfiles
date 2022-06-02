#!/bin/bash

# Turns ~ into your user dir. For use with zsh
set -o magicequalsubst

# Add VS Code `code`
#export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
# If you are an insider... Like me :)
export PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin:$PATH"

# If terminal is opened at ~,
if [[ $PWD == ~ ]]
then
    # I prefer to start in my user vs folder always
    cd ~/vs
fi


