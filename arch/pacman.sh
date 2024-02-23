echo "Syncing packages"
sudo pacman -Syyu;

sudo pacman -S                \
  core/cronie                 \
  core/man                    \
  core/mkinitcpio             \
  extra/arandr                \
  extra/bat                   \
  extra/bluez                 \
  extra/bluez-utils           \
  extra/neofetch              \
  extra/pulseaudio            \
  extra/pulsemixer            \
  extra/python-build          \
  extra/python-installer      \
  extra/python-pyusb          \
  extra/python-wheel          \
  extra/scrot                 \
  extra/slop                  \
  extra/tree                  \
  extra/ttc-iosevka           \
  extra/wget                  \
  extra/wimlib                \
;
