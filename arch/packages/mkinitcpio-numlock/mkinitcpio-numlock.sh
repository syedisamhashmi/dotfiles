#!/usr/bin/bash

pushd $repos_dir_default
rm -rfd $repos_dir_default/mkinitcpio-numlock
git clone https://aur.archlinux.org/mkinitcpio-numlock.git

cd $repos_dir_default/mkinitcpio-numlock
makepkg -f
sudo pacman -U $(ls | grep tar.zst)


file_id=$(uuidgen | head -c 5)
echo "Backing up /etc/mkinitcpio.conf to /etc/mkinitcpio.bkp.$file_id"
sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bkp.$file_id

echo "Generating new configuration file"
new_conf_file=$(sudo sh -c \
  "cat /etc/mkinitcpio.conf | sed 's/modconf kms keyboard/modconf numlock kms keyboard/'" \
)

echo "Writing new configuration file to /etc/mkinitcpio.conf"
sudo sh -c "echo $new_conf_file > /etc/mkinitcpio.conf"

echo "Generating new initramfs.img"
sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs.img
popd
