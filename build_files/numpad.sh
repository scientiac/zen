#!/bin/bash

set -ouex pipefail

echo "=== Numpad Driver Installation Starts ==="

# Install Dependencies
dnf install -y libevdev libevdev-devel rust cargo

# Install Driver
export CARGO_HOME=/tmp/cargo
cargo install --root /usr --git "https://github.com/scientiac/asus-numpad"
rm -rf /tmp/cargo

# Create non-root system user and groups
groupadd -f uinput
groupadd -f i2c
useradd -Gi2c,input,uinput --no-create-home --system asus_numpad || true

# Enable the service to start automatically on boot
systemctl enable asus-numpad.service

# Clean up build toolchain to keep image size small
dnf remove -y rust cargo libevdev-devel

echo "=== Numpad Driver Installation Ends ==="
