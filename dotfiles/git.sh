#!/bin/bash

# Git email switcher script using dmenu
# Usage: ./git-email-switcher.sh

# Define email addresses
WORK_EMAIL="daniel@omnivers.ai"
PERSONAL_EMAIL="deschaffel97@gmail.com"

WORK_USERNAME="Daniel Schaffel"
PERSONAL_USERNAME="termdev"

# Define dmenu options
OPTIONS="work\npersonal"

# Show dmenu and capture selection
SELECTION=$(echo -e "$OPTIONS" | dmenu -i -p "Select git email profile:")

# Exit if no selection made (user pressed Escape)
if [ -z "$SELECTION" ]; then
    echo "No selection made. Exiting."
    exit 0
fi

# Set git email based on selection
case "$SELECTION" in
    "work")
        git config --global user.email "$WORK_EMAIL"
        git config --global user.name "$WORK_USERNAME"
        echo "Git email set to: $WORK_EMAIL"
        echo "Git name set to: $WORK_USERNAME"
        ;;
    "personal")
        git config --global user.email "$PERSONAL_EMAIL"
        git config --global user.name "$PERSONAL_USERNAME"
        echo "Git email set to: $PERSONAL_EMAIL"
        echo "Git name set to: $PERSONAL_USERNAME"
        ;;
    *)
        echo "Invalid selection: $SELECTION"
        exit 1
        ;;
esac

# Show current git configuration
echo "Current git user configuration:"
echo "Name: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"
