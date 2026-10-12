# zen

A custom uBlue based OS for my Zenbook.

To switch:
```sh
bootc switch ghcr.io/scientiac/zen:latest
```

Toolbox TERM warning fix for Ghostty:
```
mkdir -p ~/.terminfo/x/
cp /usr/share/terminfo/x/xterm-ghostty ~/.terminfo/x/
```
