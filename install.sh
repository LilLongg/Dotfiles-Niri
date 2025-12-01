#!/usr/bin/fish

set -l CUR "$PWD"

sudo pacman -S artix-archlinux-support
sudo pacman-key --populate archlinux

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo cp assets/pacman.conf /etc/pacman.conf
sudo cp assets/mkinitcpio.conf /etc/mkinitcpio.conf

sudo pacman -Sy yay
yay -S $(cat assets/packages.txt)

cargo install mpris-notifier

sudo cp -r custom-sddm /usr/share/sddm/themes
sudo cp assets/pixelon.regular.ttf /usr/share/fonts
echo [Theme]\nCurrent=custom-sddm | sudo tee /etc/sddm.conf
sudo cp assets/update_db /etc/cron.hourly/
sudo cp assets/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo cp assets/wireless-regdom /etc/conf.d/wireless-regdom
sudo cp assets/main.conf /etc/bluetooth/main.conf
sudo cp assets/NetworkManager /etc/dinit.d/NetworkManager
sudo cp assets/niri.desktop /usr/share/wayland-sessions/niri.desktop
sudo cp assets/ananicy-cpp /etc/dinit.d/ananicy-cpp

cd ananicy-cpp
makepkg -si
yay -S cachyos-ananicy-rules-git

cd "$CUR"

# Hibernate...
echo "w /sys/power/image_size - - - - 0" | sudo tee /etc/tmpfiles.d/hibernation_image_size.conf

sudo dinitctl enable bluetoothd
sudo dinitctl enable ufw
sudo dinitctl enable cronie
sudo dinitctl enable ntpd
sudo dinitctl enable ananicy-cpp
sudo dinitctl enable turnstiled
sudo dinitctl enable backlight
sudo dinitctl enable power-profiles-daemon
sudo dinitctl enable zramen

sudo ufw enable
sudo ufw default deny

mkdir -p ~/.cache/wpp ~/Pictures/Screenshots ~/Videos/Records ~/.venv
sudo ln -sf /usr/bin/kitty /usr/bin/gnome-terminal
rm ~/.config/fish/config.fish ~/.config/fish/fish_variables
stow home --no-folding

wpg-install.sh -iG
~/.config/niri/scripts/initbg
