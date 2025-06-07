#!/bin/bash

set -e

echo "🔧 Installing additional development tools..."

# Additional useful tools
sudo apt install -y \
    vim \
    neovim \
    jq \
    ripgrep \
    fd-find \
    bat \
    exa

# Remove these lines since they're in your dotfiles:
# tmux \
# zsh \

# Remove the Oh My Zsh installation too since your dotfiles likely handle this
# read -p "Install Oh My Zsh? (y/n): " -n 1 -r
# echo
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#     sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi

echo "🔧 Additional tools installed successfully!"