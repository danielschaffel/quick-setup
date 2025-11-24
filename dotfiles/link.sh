#!/bin/bash

PWD=$(pwd)

mkdir -p ~/.config/i3/
rm ~/.config/i3/config
ln -s "$PWD/i3" ~/.config/i3/config

mkdir -p ~/.config/hypr/
rm -rf ~/.config/hypr
ln -s "$PWD/hypr" ~/.config/

rm -rf ~/.config/waybar
ln -s "$PWD/waybar" ~/.config/

mkdir -p ~/.config/mako/
rm -rf ~/.config/mako
ln -s "$PWD/mako" ~/.config/

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

rm -rf ~/.config/kitty/
mkdir -p ~/.config/kitty/
ln -s "$PWD/kitty.conf" ~/.config/kitty/kitty.conf
