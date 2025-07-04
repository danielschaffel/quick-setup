#!/bin/bash

CWD=$(dirname "$0")
mkdir -p /home/daniel/Douments/code
cd /home/daniel/Documents/code/

if [ -d "neovim" ]; then
    echo "Neovim directory already exists. Skipping clone."
    cd neovim
    git pull origin stable
else
    echo "Cloning Neovim repository..."
    git clone https://github.com/neovim/neovim.git
fi

cd neovim
git checkout stable

sudo make clean install

cd $CWD


