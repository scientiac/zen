#!/bin/bash

set -ouex pipefail

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

### enabling a System Unit File
systemctl enable podman.socket

## hide grub
# Create custom.cfg in the image stage
mkdir -p /boot/grub2
cat <<EOF > /boot/grub2/custom.cfg
set timeout_style=hidden
set timeout=0
EOF

echo "::group:: ===$(basename "$0")==="

rm /usr/share/plymouth/themes/spinner/animation* 
rm /usr/share/plymouth/themes/spinner/throbber* 
rm /usr/share/plymouth/themes/spinner/watermark.png
dracut -f --reproducible

echo "::endgroup::"
