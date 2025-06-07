#!/bin/bash

# Add useful aliases to shell profiles
ALIASES='
# Development aliases
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias tree="tree -C"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
alias gb="git branch"
alias gco="git checkout"

# Node/npm aliases
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias pi="pnpm install"
alias pr="pnpm run"
alias ps="pnpm start"
alias pt="pnpm test"
'

# Add to bashrc if it exists
if [ -f ~/.bashrc ]; then
    echo "# Development aliases" >> ~/.bashrc
    echo "$ALIASES" >> ~/.bashrc
fi

# Add to zshrc if it exists
if [ -f ~/.zshrc ]; then
    echo "# Development aliases" >> ~/.zshrc
    echo "$ALIASES" >> ~/.zshrc
fi

echo "🔧 Aliases added to shell profiles"