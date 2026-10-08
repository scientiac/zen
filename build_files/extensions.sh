#!/bin/bash

set -ouex pipefail

echo "=== Gnome Extensions Installations Start ==="

# Installations
dnf5 -y install \
  gnome-shell-extension-blur-my-shell \
  gnome-shell-extension-just-perfection \
  gnome-shell-extension-gsconnect \
  gnome-shell-extension-appindicator 

## Copyous Ready
dnf5 -y install libgda libgda-sqlite

## Theme
dnf5 -y install adw-gtk3-theme

echo "=== Gnome Extensions Installations End ==="
