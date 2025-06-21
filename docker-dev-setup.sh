#!/bin/bash
set -euo pipefail

# This script is meant to be used in a Docker container to set up a
# development environment. It installs dotfiles, essential tools, and configures the shell.

echo "----------------------------------------"
echo "--- Installing Dependencies ---"
echo "----------------------------------------"
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends \
  git \
  curl \
  fontconfig \
  unzip \
  tmux \
  zsh \
  ripgrep \
  sudo \
  lsb-release

# Clean up apt cache
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "----------------------------------------"
echo "--- Cloning and setting up dotfiles ---"
echo "----------------------------------------"
if [ ! -d "$HOME/dotfiles" ]; then
    git clone https://github.com/boushley/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles"
    ./setup_links.sh
    cd "$HOME"
else
    echo "dotfiles directory already exists, skipping clone."
    cd "$HOME/dotfiles"
    ./setup_links.sh
    cd "$HOME"
fi

mkdir -p "$HOME/bin"

echo "----------------------------------------"
echo "--- Installing/Updating fzf ---"
echo "----------------------------------------"
if [ -d "$HOME/.fzf" ]; then
  echo "fzf already installed, updating..."
  (cd "$HOME/.fzf" && git pull && ./install --all)
else
  echo "Cloning and installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --bin
  ln -s "$HOME/.fzf/bin/fzf" "$HOME/bin/fzf"
fi

echo "----------------------------------------"
echo "--- Installing/Updating Neovim ---"
echo "----------------------------------------"
ARCH=$(uname -m)
case $ARCH in
x86_64) APPIMAGE_FILENAME="nvim-linux-x86_64.tar.gz"; NEOVIM_DIR="nvim-linux-x86_64"; ;;
aarch64 | arm64) APPIMAGE_FILENAME="nvim-linux-arm64.tar.gz"; NEOVIM_DIR="nvim-linux-arm64"; ;;
*) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;;
esac

DOWNLOAD_URL="https://github.com/neovim/neovim/releases/latest/download/${APPIMAGE_FILENAME}"

TEMP_DIR=$(mktemp -d)
echo "Installing Neovim, working directory ${TEMP_DIR}..."
echo "Downloading from ${DOWNLOAD_URL}"
curl -Lo "${TEMP_DIR}/${APPIMAGE_FILENAME}" "$DOWNLOAD_URL"
tar -zxf "${TEMP_DIR}/${APPIMAGE_FILENAME}" -C "${TEMP_DIR}"
# Switch to root to move to /usr/local
su - root -c "mv ${TEMP_DIR}/${NEOVIM_DIR} /usr/local/nvim"
su - root -c "ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim"

rm -rf "$TEMP_DIR"
echo "Neovim installed."

echo "----------------------------------------"
echo "--- Installing/Updating Starship ---"
echo "----------------------------------------"
curl -sS https://starship.rs/install.sh | sh -s -- --yes
echo "Starship installed."

echo "----------------------------------------"
echo "--- Setting zsh as default shell ---"
echo "----------------------------------------"
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Changing shell to zsh for user $(whoami)..."
    # This requires root to run chsh
    su - root -c "chsh -s $(command -v zsh) $USERNAME"
    echo "Shell changed to zsh. Please log out and back in for the change to take effect."
else
    echo "zsh is already the default shell."
fi

EOF
echo "All done!" 