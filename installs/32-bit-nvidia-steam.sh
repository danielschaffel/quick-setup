#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y libnvidia-gl-570:i386
