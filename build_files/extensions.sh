#!/bin/bash

set -ouex pipefail

echo "=== Gnome Extensions Installations Start ==="

# Installations
dnf5 -y install \
  gnome-shell-extension-blur-my-shell \
  gnome-shell-extension-just-perfection \
  gnome-shell-extension-gsconnect \
  gnome-shell-extension-appindicator 

echo "=== Gnome Extensions Installations End ==="
