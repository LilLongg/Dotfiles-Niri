#!/usr/bin/fish

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo cp assets/pacman.conf /etc/pacman.conf

sudo pacman -Sy yay
yay -S $(cat assets/packages.txt)

sudo cp assets/update-db.service /etc/systemd/system/
sudo cp -r custom-sddm /usr/share/sddm/themes
sudo cp assets/pixelon.regular.ttf /usr/share/fonts
echo [Theme]\nCurrent=custom-sddm | sudo tee /etc/sddm.conf
sudo cp assets/update_db /etc/cron.hourly/
sudo cp assets/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo cp assets/wifi_backend.conf /etc/NetworkManager/conf.d/wifi_backend.conf
sudo cp assets/zram-generator.conf /etc/systemd/zram-generator.conf
sudo cp assets/chrony.conf /etc/chrony.conf

# Hibernate...
echo "w /sys/power/image_size - - - - 0" | sudo tee /etc/tmpfiles.d/hibernation_image_size.conf
echo "259:2" | sudo tee /sys/power/resume

systemctl enable --user mpd mpd-mpris pipewire-pulse wireplumber hypridle
sudo systemctl enable bluetooth ufw cronie sddm update-db systemd-zram-setup@zram0 chronyd
sudo ufw enable
sudo ufw default deny

mkdir -p ~/.cache/wpp ~/Pictures/Screenshots ~/Videos/Records
sudo ln -sf /usr/bin/kitty /usr/bin/gnome-terminal
stow home --no-folding

wpg-install.sh -iG
~/.config/niri/scripts/initbg
