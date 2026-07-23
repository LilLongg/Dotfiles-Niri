#!/usr/bin/env bash

nixos-generate-config --root /tmp/config --no-filesystems
cp ./configuration.nix /tmp/config/etc/nixos/configuration.nix
nix run 'github:nix-community/disko/latest#disko-install' -- --write-efi-boot-entries --flake '/tmp/config/etc/nixos' --disk main /dev/nvme0n1
