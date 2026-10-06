#!/bin/bash

set -ouex pipefail

echo "=== Numpad Driver Installation Starts ==="

# 1. Install Dependencies
dnf install -y libevdev libevdev-devel rust cargo

# 2. Install Driver
cargo install --root /usr --git "https://github.com/scientiac/asus-numpad"

# 3. Create non-root system user and groups
groupadd -f uinput
groupadd -f i2c
useradd -Gi2c,input,uinput --no-create-home --system asus_numpad || true

# 4. Auto-load required kernel modules (i2c-dev, uinput) at boot
mkdir -p /usr/lib/modules-load.d
cat <<EOF > /usr/lib/modules-load.d/asus-numpad.conf
i2c-dev
uinput
EOF

# 5. Add udev rule for uinput group permissions
mkdir -p /usr/lib/udev/rules.d
cat <<EOF > /usr/lib/udev/rules.d/99-asus-numpad-uinput.rules
KERNEL=="uinput", GROUP="uinput", MODE:="0660"
EOF

# 6. Default configuration file (/etc/xdg/asus_numpad.toml)
mkdir -p /etc/xdg
cat <<EOF > /etc/xdg/asus_numpad.toml
layout = "UX433FA"
EOF

# 7. Create systemd service
cat <<EOF > /usr/lib/systemd/system/asus-numpad.service
[Unit]
Description=Asus Touchpad Numpad Driver
After=multi-user.target

[Service]
Type=simple
User=asus_numpad
ExecStart=/usr/bin/asus-numpad
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# 8. Enable the service to start automatically on boot
systemctl enable asus-numpad.service

# 9. Clean up build toolchain to keep image size small
dnf remove -y rust cargo libevdev-devel

echo "=== Numpad Driver Installation Ends ==="
