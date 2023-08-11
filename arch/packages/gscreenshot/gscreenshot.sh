#/usr/bin/bash

pushd $repos_dir_default
rm -rfd $repos_dir_default/gscreenshot
git clone https://aur.archlinux.org/gscreenshot.git
cd $repos_dir_default/gscreenshot

git clean -dfx

makepkg -fi
