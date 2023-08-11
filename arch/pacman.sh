echo "Syncing packages"
sudo pacman -Syyu;

sudo pacman -S      \
  core/cronie       \
  core/man          \
  core/mkinitcpio   \
  extra/arandr      \
  extra/bluez       \
  extra/bluez-utils \
  extra/neofetch    \
  extra/pulseaudio  \
  extra/pulsemixer  \
  extra/scrot       \
  extra/slop        \
  extra/tree        \
  extra/ttc-iosevka \
  extra/wget        \
  extra/wimlib      \
;
