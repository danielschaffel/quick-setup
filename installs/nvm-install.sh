# Check if NVM is already installed
if ! command -v nvm &> /dev/null && [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    echo "NVM not found. Installing NVM..."
    
    # Install NVM
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    
    # Reload your shell
    source ~/.bashrc
    
    # Install latest LTS version
    nvm install --lts
    nvm use --lts
    
    echo "NVM and Node.js LTS installed successfully!"
else
    echo "NVM is already installed."
    echo "Current NVM version: $(nvm --version 2>/dev/null || echo 'NVM found but not loaded in current shell')"
fi
