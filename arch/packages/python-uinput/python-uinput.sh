#/usr/bin/bash

pushd $repos_dir_default
rm -rfd $repos_dir_default/python-uinput
git clone https://aur.archlinux.org/python-uinput.git
cd $repos_dir_default/python-uinput

git clean -dfx

makepkg -fi
