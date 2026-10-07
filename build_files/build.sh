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
export HOME=/var/root
mkdir -p "$HOME/.local/share"
dnf5 install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update --appstream
flatpak install --system --noninteractive flathub io.github.kolunmi.Bazaar

### enabling a System Unit File
systemctl enable podman.socket

### grub user configuration
systemctl enable grub-cfg.service

echo "=== Installations End ==="
