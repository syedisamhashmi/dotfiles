#!/bin/bash

# Turns ~ into your user dir. For use with zsh
set -o magicequalsubst

# Add VS Code `code`
#export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
# If you are an insider... Like me :)
export PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin:$PATH"

# Add gnubin to path, for using gnu grep, sed, etc.
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# If terminal is opened at ~,
if [[ $PWD == ~ ]]
then
    # I prefer to start in my user vs folder always
    cd ~/vs
fi
