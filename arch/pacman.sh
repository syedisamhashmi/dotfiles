echo "Syncing packages"
sudo pacman -Syyu;

sudo pacman -S        \
  core/man            \
  core/mkinitcpio     \
  extra/neofetch      \
  extra/tree          \
  extra/wget          \
  extra/wimlib        \
;
