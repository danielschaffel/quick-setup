#!/bin/bash

# config (no remote origin)
# clipmenu
# clipnotify
# dmenu
# picom
CODE_HOME="/home/daniel/Documents/code/"
GITHUB="git@github.com:"

OMNI="ZeeshRPM"

OMNI_REPOS=("omnivers-cart-android" "omnivers-react" "ZoomRPM" "ZoomRPM-App" "ZoomRPM-Cart-Tablet" "zoomrpm-firebase" "ZoomRPM-PCC-API-Prod")

cd $CODE_HOME 

for repo in "${OMNI_REPOS[@]}"; do 
    repo_url="$GITHUB$OMNI/$repo.git"
    repo_name=$(basename "$repo_url" .git)
    echo $repo_url
    echo $repo_name
    if [ -d "$repo_name" ]; then
        echo "Repository '$repo_name' already exists, skipping clone."
    else
        echo "Cloning '$repo_name'..."
        #git clone "$repo_url"
    fi
    echo $link
    echo $base
done

cd -
