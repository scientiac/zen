#!/bin/bash

set -ouex pipefail

echo "::group:: ===$(basename "$0")==="

rm /usr/share/plymouth/themes/spinner/animation* 
rm /usr/share/plymouth/themes/spinner/throbber* 
rm /usr/share/plymouth/themes/spinner/watermark.png

echo "::endgroup::"
