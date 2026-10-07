#!/bin/bash

set -ouex pipefail

echo "=== Installations Start ==="

# copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

## ghostty
dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty nautilus-python
ln -s $(which ghostty) /usr/local/bin/xdg-terminal-exec

## keyd
dnf5 -y copr enable alternateved/keyd
dnf5 -y install keyd
systemctl enable keyd

## lazygit
dnf5 -y copr enable dejan/lazygit
dnf5 -y install lazygit

## Bazaar
dnf5 -y copr enable ublue-os/packages
dnf5 -y install bazaar

## this installs a package from fedora repos
dnf5 install -y tmux neovim zoxide

### enabling a System Unit File
systemctl enable podman.socket

### grub user configuration
systemctl enable grub-cfg.service

echo "=== Installations End ==="
