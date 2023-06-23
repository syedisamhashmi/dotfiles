echo "Syncing packages"
sudo pacman -Syyu;

sudo pacman -S        \
  core/cronie         \
  core/man            \
  core/mkinitcpio     \
  extra/neofetch      \
  extra/pulseaudio    \
  extra/pulsemixer    \
  extra/tree          \
  extra/wget          \
  extra/wimlib        \
;
