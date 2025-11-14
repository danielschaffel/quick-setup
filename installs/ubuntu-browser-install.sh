#!/bin/bash

mkdir ~/Downloads
wget -O ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install ~/Downloads/google-chrome*.deb
