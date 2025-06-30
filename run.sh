#!/bin/bash

cd ./installs/ 
./installs.sh
cd ..

cd ./dotfiles/
./link.sh
cd ..

