#!/bin/bash

PACKAGES="htop make cmake git fzf tmux python-is-python3 ripgrep nodejs npm curl pavucontrol fonts-firacode fonts-powerline brightnessctl blueman python3.12-venv tree"

# if we are in ubuntu or debian based system
# then run the apt installs script
# else run arch based installs script
if [ -f /etc/debian_version ]; then
    echo "Debian based system detected. Running apt installs."
    ./ubuntu.sh
elif [ -f /etc/arch-release ]; then
    echo "Arch based system detected. Running pacman installs."
    ./arch.sh
else
    echo "Unsupported OS. Exiting."
    exit 1
fi
./nvm-install.sh
./neovim-install.sh

