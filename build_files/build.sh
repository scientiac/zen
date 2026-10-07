#!/bin/bash

set -ouex pipefail

echo "=== Installations Start ==="

# copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

## ghostty
dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty

## keyd
dnf5 -y copr enable alternateved/keyd
dnf5 -y install keyd
systemctl enable keyd

## lazygit
dnf5 -y copr enable dejan/lazygit
dnf5 -y install lazygit

## this installs a package from fedora repos
dnf5 install -y tmux neovim zoxide

## enable Bazaar
flatpak install --system --noninteractive --location=/usr/share/flatpak flathub io.github.kolunmi.Bazaar

### enabling a System Unit File
systemctl enable podman.socket

### grub user configuration
systemctl enable grub-cfg.service

echo "=== Installations End ==="
