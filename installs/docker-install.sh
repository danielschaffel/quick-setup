#!/bin/bash
set -e

if [ -f /etc/arch-release ]; then
    sudo pacman -S --needed --noconfirm docker docker-buildx docker-compose
elif [ -f /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings

    . /etc/os-release
    if [ "$ID" = "debian" ]; then
        DOCKER_REPO="https://download.docker.com/linux/debian"
    else
        DOCKER_REPO="https://download.docker.com/linux/ubuntu"
    fi

    sudo curl -fsSL "$DOCKER_REPO/gpg" -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] $DOCKER_REPO $VERSION_CODENAME stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Unsupported OS. Exiting."
    exit 1
fi

sudo systemctl enable docker
sudo systemctl start docker

if ! getent group docker > /dev/null; then
    sudo groupadd docker
fi
sudo usermod -aG docker "$USER"

echo "Docker installed. Log out and back in (or run 'newgrp docker') for group membership to take effect."
