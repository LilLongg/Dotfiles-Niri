#!/usr/bin/env bash

git clone https://github.com/LilLongg/Wallpaper.git ~/Wallpaper
cd ~/Wallpaper
git lfs pull

mkdir -p ~/.venv ~/.cache/wpp ~/Pictures/Screenshots ~/Videos/Records
rm -rf ~/.config/fish

cd ~/Dotfiles
sudo nixos-rebuild switch --flake . --impure
home-manager switch --flake . --impure

pywalfox install
wpg-install.sh -iG

nix-index
