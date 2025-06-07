# Development Environment Setup

A modular bash script collection to quickly set up a development environment on a fresh Linux system.

## 🚀 Quick Start

```bash
git clone <your-repo-url>
cd dev-environment-setup
chmod +x setup-dev-environment.sh scripts/*.sh
./setup-dev-environment.sh
```

## 📁 Structure

```
dev-environment-setup/
├── setup-dev-environment.sh    # Main setup script
├── scripts/
│   ├── optional-docker.sh      # Docker installation
│   ├── optional-vscode.sh      # VS Code installation
│   └── extras.sh              # Additional dev tools
└── configs/
    ├── .gitconfig-template    # Git configuration
    └── aliases.sh            # Useful shell aliases
```

## 🔧 What's Included

### Core Installation (main script)
- System updates and essential tools
- Python 3 with pip and venv
- NVM + Node.js LTS
- pnpm and turbo
- Git configuration
- SSH client and key generation
- Shell aliases

### Optional Components
- **Docker** (`./scripts/optional-docker.sh`)
- **VS Code** (`./scripts/optional-vscode.sh`) 
- **Extra tools** (`./scripts/extras.sh`) - vim, tmux, zsh, etc.

## 🎯 Usage

1. **Run core setup:**
   ```bash
   ./setup-dev-environment.sh
   ```

2. **Add optional components:**
   ```bash
   ./scripts/optional-docker.sh
   ./scripts/optional-vscode.sh
   ./scripts/extras.sh
   ```

3. **Restart terminal or source profiles:**
   ```bash
   source ~/.bashrc
   ```

## 🔐 SSH Setup

The setup automatically:
- Installs OpenSSH client
- Generates ED25519 SSH key pair (if none exists)
- Creates SSH config with common settings
- Displays your public key for easy copying to GitHub/GitLab

Your SSH key will be saved to `~/.ssh/id_ed25519` and the public key displayed for you to copy to your Git hosting service.


## ✨ Features

- **Modular design** - Install only what you need
- **Error handling** - Exits on any error
- **Cross-shell support** - Works with bash and zsh
- **Version verification** - Shows installed versions
- **SSH key generation** - Automatic SSH setup for Git repositories
- **Useful aliases** - Pre-configured development shortcuts

---

**Ready to code!** 🚀