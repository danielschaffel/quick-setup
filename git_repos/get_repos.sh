#!/bin/bash

# config (no remote origin)
# clipmenu
# clipnotify
# dmenu
# picom
CODE_HOME="/home/daniel/Documents/code/"
GITHUB="git@github.com:"

PERSONAL="danielschaffel"

PERSONAL_REPOS=("quick-setup" "dmenu")

cd $CODE_HOME

for repo in "${PERSONAL_REPOS[@]}"; do
    repo_url="$GITHUB$PERSONAL/$repo.git"
    repo_name=$(basename "$repo_url" .git)
    if [ -d "$repo_name" ]; then
        echo "Repository '$repo_name' already exists, skipping clone."
    else
        echo "Cloning '$repo_name'..."
        git clone "$repo_url"
    fi
done

cd -
