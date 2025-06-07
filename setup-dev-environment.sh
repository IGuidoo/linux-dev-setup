#!/bin/bash

set -e  # Exit on any error

echo "🚀 Setting up development environment..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install essential tools
echo "🔧 Installing essential tools..."
sudo apt install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    unzip \
    eza \
    htop \
    tree \
    openssh-client

# Install Python3 and pip
echo "🐍 Installing Python3 and pip..."
sudo apt install -y python3 python3-pip python3-venv

# Install NVM (Node Version Manager)
echo "📱 Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Source NVM to use it immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install latest LTS Node.js
echo "📦 Installing Node.js LTS..."
nvm install --lts
nvm use --lts
nvm alias default lts/*

# Install global npm packages
echo "📦 Installing global npm packages..."
npm install -g pnpm turbo

# Configure Git
source ./configs/.gitconfig-template.sh

# Set up SSH
# source ./configs/ssh-setup.sh

# Set up shell profile for NVM
echo "🔧 Setting up shell profile..."
if [ -f ~/.bashrc ]; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
    echo 'export PNPM_HOME="$HOME/.local/share/pnpm"' >> ~/.bashrc
    echo 'export PATH="$PNPM_HOME:$PATH"' >> ~/.bashrc
fi

if [ -f ~/.zshrc ]; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
    echo 'export PNPM_HOME="$HOME/.local/share/pnpm"' >> ~/.zshrc
    echo 'export PATH="$PNPM_HOME:$PATH"' >> ~/.zshrc
fi


# Load aliases
source ./configs/aliases.sh

# Display versions
echo "✅ Installation complete! Here are the installed versions:"
echo "🐍 Python: $(python3 --version)"
echo "📱 Node.js: $(node --version)"
echo "📦 npm: $(npm --version)"
echo "📦 pnpm: $(pnpm --version)"
echo "⚡ turbo: $(turbo --version)"
echo "🔐 SSH: $(ssh -V 2>&1 | head -n1)"


echo ""
echo "🎉 Core setup complete!"
echo ""
echo "📝 Optional installations available:"
echo "  ./scripts/optional-docker.sh    - Install Docker"
echo "  ./scripts/optional-vscode.sh    - Install VS Code"
echo "  ./scripts/optional-ssh.sh       - Configure SSH client"
echo "  ./scripts/extras.sh            - Additional dev tools"
echo ""
echo "⚠️  Please run 'source ~/.bashrc' or restart your terminal to use NVM"