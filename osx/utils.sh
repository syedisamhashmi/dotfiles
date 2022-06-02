#!/bin/bash

osx_tabname() {
  printf "\e]1;$1\a"
}

osx_newtab() {
  TAB_NAME=$1
  COMMAND=$2
  # ! Requires allowing osascript accessibility on OSX (potentially automator)
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}