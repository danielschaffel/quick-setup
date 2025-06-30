#!/bin/bash

cd ./installs/ 
./installs.sh
cd -

cd ./dotfiles/
./link.sh
cd -

cd ./git_repos/
./get_repos.sh
cd -
