#!/bin/bash

set -ouex pipefail

# create /boot/grub2/custom.cfg to override timeout settings
mkdir -p /boot/grub2
cat <<EOF > /boot/grub2/custom.cfg
set timeout_style=hidden
set timeout=0
EOF

