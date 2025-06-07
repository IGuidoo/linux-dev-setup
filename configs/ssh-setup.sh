#!/bin/bash

echo "🔐 Setting up SSH..."

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Check if SSH key already exists
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "📝 No SSH key found. Let's create one!"
    
    read -p "Enter your email for SSH key: " ssh_email
    
    # Generate SSH key
    ssh-keygen -t ed25519 -C "$ssh_email" -f ~/.ssh/id_ed25519
    
    echo "🔑 SSH key generated successfully!"
else
    echo "🔑 SSH key already exists"
fi

# Set proper permissions
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# Start SSH agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Create SSH config file with Linux-compatible settings
if [ ! -f ~/.ssh/config ]; then
    cat > ~/.ssh/config << EOF
# Default settings for all hosts
Host *
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_ed25519
    ServerAliveInterval 60
    ServerAliveCountMax 3

# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519

# GitLab
Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_ed25519
EOF
    chmod 600 ~/.ssh/config
    echo "📄 SSH config file created"
else
    echo "📄 SSH config file already exists"
fi

# Display public key for easy copying
echo ""
echo "🔑 Your SSH public key (copy this to GitHub/GitLab):"
echo "=================================================="
cat ~/.ssh/id_ed25519.pub
echo "=================================================="
echo ""
echo "📋 To add this key to GitHub:"
echo "   1. Go to GitHub.com → Settings → SSH and GPG keys"
echo "   2. Click 'New SSH key'"
echo "   3. Paste the key above"
echo ""
echo "📋 To add this key to GitLab:"
echo "   1. Go to GitLab.com → User Settings → SSH Keys"
echo "   2. Paste the key above"
echo ""

# Test SSH connection (optional)
read -p "Test SSH connection to GitHub? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🧪 Testing SSH connection to GitHub..."
    ssh -T git@github.com || echo "⚠️  SSH test completed (authentication expected to fail until you add the key to GitHub)"
fi

echo "🔐 SSH setup complete!"