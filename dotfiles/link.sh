#!/bin/bash

PWD=$(pwd)

mkdir -p ~/.config/i3/
rm ~/.config/i3/config
ln -s "$PWD/i3" ~/.config/i3/config

rm ~/.tmux.conf
ln -s "$PWD/.tmux.conf" ~/

rm -rf ~/.config/nvim
ln -s "$PWD/nvim" ~/.config/

rm -rf ~/scripts
ln -s "$PWD/scripts" ~/

rm -rf ~/.bashrc
ln -s "$PWD/.bashrc" ~/

rm -rf ~/.profile
ln -s "$PWD/.profile" ~/ 
