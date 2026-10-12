#!/bin/bash

set -ouex pipefail

echo "=== Installation for Shell Start ==="

## zsh
dnf5 -y install zsh

# Install pure prompt.
git clone --depth 1 https://github.com/sindresorhus/pure.git /tmp/pure
install -m 644 /tmp/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
install -m 644 /tmp/pure/async.zsh /usr/local/share/zsh/site-functions/async

# Change Shell to zsh
chsh -s $(which zsh)

echo "=== Installation for Shell End ==="
