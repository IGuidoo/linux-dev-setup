#!/bin/bash

set -e  # Exit on any error

echo "🚀 Bootstrapping development environment on fresh system..."

# Check if we're on a Debian/Ubuntu system
if ! command -v apt &> /dev/null; then
    echo "❌ This script is designed for Debian/Ubuntu systems with apt package manager"
    exit 1
fi

# Install git first (the only thing we need to bootstrap)
echo "📦 Installing Git..."
sudo apt update
sudo apt install -y git

# Clone the setup repo (this will be the current directory when run via curl)
echo "📥 Cloning linux-dev-setup repository..."
git clone https://github.com/IGuidoo/linux-dev-setup.git
cd linux-dev-setup

# Make scripts executable
echo "🔧 Making scripts executable..."
chmod +x setup-dev-environment.sh scripts/*.sh

# Run the main setup
echo "🚀 Starting main development environment setup..."
./setup-dev-environment.sh

echo ""
echo "✅ Bootstrap complete!"
echo "🎉 Your development environment is ready!"