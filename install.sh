#!/usr/bin/env bash

sudo curl https://raw.githubusercontent.com/desiirenav/nixcfg/refs/heads/main/modules/base/hardware/disko.nix -o /tmp/disko.nix

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix

sudo mkdir -p /mnt/persist/passwords

echo "Please enter your root password"

read root

sudo mkpasswd -m sha-512 "$root" > /mnt/persist/passwords/root

echo "Please enter your host password"

read host

sudo mkpasswd -m sha-512 "$host" > /mnt/persist/passwords/narayan

sudo mkdir -p /mnt/home/narayan/nixcfg 

git clone https://github.com/desiirenav/nixcfg.git && \
sudo cp -r nixcfg/. /mnt/home/narayan/nixcfg && \
sudo cp -r /mnt/home/narayan/nixcfg /mnt/persist && \
cd /mnt/home/narayan/nixcfg && \
sudo rm -rf .git && \
NIX_CONFIG="experimental-features = nix-command flakes" \
  sudo nixos-install --flake .#nixos --no-root-passwd



