#!/usr/bin/env bash

git clone https://github.com/LilLongg/Wallpaper.git ~/Wallpaper
mkdir -p ~/.venv ~/.cache/wpp ~/Pictures/Screenshots ~/Videos/Records

sudo nixos-rebuild switch --flake .
home-manager switch --flake .

pywalfox install
