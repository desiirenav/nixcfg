#!/usr/bin/env bash

export DISK=/dev/nvme0n1

BOOTDISK="$DISK"p1
SWAPDISK="$DISK"p2
ZFSDISK="$DISK"p3

sudo parted $DISK --script \
  unit MiB \
  mklabel gpt \
  mkpart ESP fat32 1 4097 \
  set 1 boot on \
  mkpart swap linux-swap 4097 20481 \
  mkpart primary 20481 100% \

for i in {1..3}; do sudo parted $DISK -- align-check optimal $i; done

sudo mkswap "$SWAPDISK" --label "SWAP"
sudo swapon "$SWAPDISK"

sudo mkfs.fat -F 32 "$BOOTDISK" -n NIXBOOT

sudo zpool create -f \
    -o ashift=12 \
    -O compression=zstd \
    -O acltype=posixacl \
    -O atime=off \
    -O xattr=sa \
    -O mountpoint=none \
    zroot "$ZFSDISK"

sudo zfs create -o mountpoint=legacy zroot/root
sudo zfs snapshot zroot/root@blank
sudo mount -t zfs zroot/root /mnt

sudo mount --mkdir "$BOOTDISK" /mnt/boot

sudo zfs create -o mountpoint=legacy zroot/nix
sudo mount --mkdir -t zfs zroot/nix /mnt/nix

sudo zfs create -o mountpoint=legacy zroot/persist
sudo mount --mkdir -t zfs zroot/persist /mnt/persist

sudo mkdir -p /mnt/persist/passwords
echo "Please enter your root password"
read root
sudo mkpasswd -m sha-512 "$root" > /mnt/persist/passwords/root
echo "Please enter your host password"
read host
sudo mkpasswd -m sha-512 "$host" > /mnt/persist/passwords/narayan

git clone https://github.com/desiirenav/nixcfg.git && \
cd /home/nixos/nixcfg && \
sudo rm -rf .git && \
NIX_CONFIG="experimental-features = nix-command flakes" \
  nix flake update && \
  sudo nixos-install --flake .#nixos --no-root-passwd


