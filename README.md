# Development Environment Setup

A modular bash script collection to quickly set up a development environment on a fresh Linux system.

## 🚀 Fresh System Quick Start

### One-liner Bootstrap (Recommended for fresh systems)
```bash
curl -fsSL https://raw.githubusercontent.com/IGuidoo/linux-dev-setup/main/bootstrap.sh | bash
```

### Manual Bootstrap Steps
```bash
# 1. Install git first
sudo apt update && sudo apt install -y git

# 2. Clone and run
git clone https://github.com/IGuidoo/linux-dev-setup.git
cd linux-dev-setup
chmod +x setup-dev-environment.sh scripts/*.sh
./setup-dev-environment.sh
```

## 🔧 Already Have Git?

```bash
git clone https://github.com/IGuidoo/linux-dev-setup.git
cd linux-dev-setup
chmod +x setup-dev-environment.sh scripts/*.sh
./setup-dev-environment.sh
```

## 📁 Structure

```
linux-dev-setup/
├── bootstrap.sh                # Bootstrap script for fresh systems
├── setup-dev-environment.sh    # Main setup script
├── scripts/
│   ├── optional-docker.sh      # Docker installation
│   ├── optional-ssh.sh         # Ssh installation
│   ├── optional-vscode.sh      # VS Code installation
│   └── extras.sh              # Additional dev tools
└── configs/
    ├── .gitconfig-template    # Git configuration
    └── aliases.sh             # Useful shell aliases
    └── ssh-setup.sh           # Ssh configuration
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