#!/bin/bash

echo "=== Plymouth Setup Starts ==="

set -exuo pipefail

rm /usr/share/plymouth/themes/spinner/animation*.png
rm /usr/share/plymouth/themes/spinner/throbber*.png
rm /usr/share/plymouth/themes/spinner/watermark.png

KERNEL_VERSION=$(ls /lib/modules | grep -E 'fc|el' | tail -n1)
export DRACUT_NO_XATTR=1

dracut --no-hostonly --kver "${KERNEL_VERSION}" --reproducible -v --add ostree -f "/lib/modules/${KERNEL_VERSION}/initramfs.img"
chmod 0600 "/lib/modules/${KERNEL_VERSION}/initramfs.img"

echo "=== Plymouth Setup Ends ==="
