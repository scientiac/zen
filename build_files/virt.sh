#!/bin/bash

set -ouex pipefail

echo "=== Virtualization Installations Start ==="

# Install Packages
dnf5 install -y install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-install virt-manager virt-top virt-viewer

# Enable Daemon
systemctl enable libvirtd

echo "=== Virtualization Installations End ==="
