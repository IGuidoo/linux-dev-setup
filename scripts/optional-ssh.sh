#!/bin/bash

set -e

echo "🔐 Installing and configuring SSH client..."

# Install SSH client if not already installed
sudo apt install -y openssh-client

# Run SSH setup
source ../configs/ssh-setup.sh

echo "🔐 SSH client setup complete!"