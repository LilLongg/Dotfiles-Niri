#!/usr/bin/env bash

git clone https://github.com/LilLongg/Wallpaper.git ~/Wallpaper
mkdir -p ~/.venv ~/.cache/wpp ~/Pictures/Screenshots ~/Videos/Records
rm -rf ~/.config/fish

sudo nixos-rebuild switch --flake . --impure
home-manager switch --flake . --impure

pywalfox install
