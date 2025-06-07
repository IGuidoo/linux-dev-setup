
#!/bin/bash

echo "🔧 Configuring Git..."
read -p "Enter your Git username: " git_username
read -p "Enter your Git email: " git_email
git config --global user.name "$git_username"
git config --global user.email "$git_email"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global pull.rebase false