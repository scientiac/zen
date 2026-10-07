#!/bin/bash

set -ouex pipefail

cat <<EOF > /boot/grub2/user.cfg
set gfxmode=1920x1200,1440x900,auto
insmod gfxterm
set gfxpayload=keep
terminal_input gfxterm
terminal_output gfxterm

set timeout_style=hidden
set timeout=0
EOF
