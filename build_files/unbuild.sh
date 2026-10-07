#!/bin/bash

set -ouex pipefail

echo "=== Cleanup Sequence Starts ==="

### unInstall packages
dnf5 remove -y ptyxis
 gnome-software \
 gnome-tour \
 nvtop \
 yelp \

dnf5 remove -y \
 gnome-shell-extension-apps-menu \
 gnome-shell-extension-launch-new-instance \
 gnome-shell-extension-places-menu \
 gnome-shell-extension-window-list \
 gnome-shell-extension-background-logo \
 gnome-extensions-app \

APPS="
org.gnome.Extensions
org.gnome.Connections
org.fedoraproject.MediaWriter
"

# Remove default flatpak apps.
for app in $APPS; do
  if flatpak info --system "$app" >/dev/null 2>&1; then
    flatpak uninstall --system --delete-data -y "$app"
    flatpak mask "$app"
  fi
done


# Remove annoying fedora flatpaks
rm -rf /usr/lib/systemd/system/flatpak-add-fedora-repos.service
UNIT=flatpak-add-flathub-repos.service
if [ -f "/usr/lib/systemd/system/$UNIT" ] || [ -f "/etc/systemd/system/$UNIT" ]; then
    systemctl enable "$UNIT"
fi

echo "=== Cleanup Sequence Ends ==="
