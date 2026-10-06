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

# 1. Get current kernel version
KERNEL_VERSION=$(ls /lib/modules | sort -V | tail -n 1)

# 2. Rebuild initramfs directly into /usr/lib/modules (not /boot)
dracut -f --reproducible /usr/lib/modules/"$KERNEL_VERSION"/initramfs.img "$KERNEL_VERSION"

echo "::endgroup::"
