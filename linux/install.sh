#!/bin/bash
set -euo pipefail

# This script installs or updates fzf, tmux, and Neovim to their latest versions.
# It avoids using `apt` for the main packages to get up-to-date versions.
# It assumes you are on a Debian-based Linux distribution for dependency installation instructions.

echo "----------------------------------------"
echo "--- Installing Dependencies ---"
echo "----------------------------------------"
sudo apt-get update
sudo apt-get install -y \
  build-essential \
  cmake \
  libevent-dev \
  libncurses-dev \
  bison \
  pkg-config \
  git \
  curl \
  fontconfig \
  unzip \
  luarocks \
  zsh \
  mesa-utils \
  golang \
  python3 \
  python3-pip \
  clangd \
  ripgrep \
  nodejs \
  npm
echo "Dependencies installed."

echo "----------------------------------------"
echo "--- Installing Nerd Fonts ---"
echo "----------------------------------------"
# We are installing the fonts to the user's local font directory
# so we don't need sudo.
FONT_DIR="$HOME/.local/share/fonts"
echo "Creating font directory at $FONT_DIR"
mkdir -p "$FONT_DIR"

# Declare a function to download and install a font
install_nerd_font() {
  FONT_NAME=$1
  # Check if font files already exist by looking for a file with the font name
  if find "$FONT_DIR" -name "*${FONT_NAME}*Nerd*Font*" -print -quit | grep -q .; then
    echo "${FONT_NAME} Nerd Font already installed, skipping."
    return
  fi
  TEMP_DIR=$(mktemp -d)
  echo "Downloading ${FONT_NAME} Nerd Font, working directory ${TEMP_DIR}..."
  # Use a temporary directory to download and extract
  curl -Lo "${TEMP_DIR}/${FONT_NAME}.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip"
  unzip "${TEMP_DIR}/${FONT_NAME}.zip" -d "${FONT_DIR}"
  rm -rf "${TEMP_DIR}"
  echo "${FONT_NAME} Nerd Font installed."
}

# Install requested fonts
install_nerd_font "JetBrainsMono"
install_nerd_font "SpaceMono"

mkdir -p ~/bin

# Update the font cache
echo "Updating font cache..."
fc-cache -fv
echo "Nerd Fonts installed."

echo "----------------------------------------"
echo "--- Installing/Updating fzf ---"
echo "----------------------------------------"
if [ -d "$HOME/.fzf" ]; then
  echo "fzf already installed, updating..."
  (cd "$HOME/.fzf" && git pull && ./install --all)
else
  echo "Cloning and installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --bin
  ln -s ~/.fzf/bin/fzf ~/bin/fzf
fi

echo "----------------------------------------"
echo "--- Installing/Updating tmux ---"
echo "----------------------------------------"
TMUX_VERSION="3.4"
INSTALL_TMUX=true

if command -v tmux &>/dev/null; then
  INSTALLED_TMUX_VERSION=$(tmux -V | cut -d ' ' -f 2 | sed 's/[a-z]//g')
  # Check if installed version is greater or equal to target version
  if [ "$(printf '%s\n' "$TMUX_VERSION" "$INSTALLED_TMUX_VERSION" | sort -V | head -n1)" = "$TMUX_VERSION" ]; then
    echo "tmux version $INSTALLED_TMUX_VERSION is already installed and up-to-date. Skipping tmux installation."
    INSTALL_TMUX=false
  fi
fi

if [ "$INSTALL_TMUX" = true ]; then
  # Building from source
  TEMP_DIR=$(mktemp -d)
  echo "Installing tmux ${TMUX_VERSION} from source, working directory ${TEMP_DIR}..."
  cd "$TEMP_DIR"
  curl -LO https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
  tar -zxf tmux-${TMUX_VERSION}.tar.gz
  cd tmux-${TMUX_VERSION}
  ./configure
  make
  sudo make install
  cd /
  rm -rf "$TEMP_DIR"
  echo "tmux installed."
fi

echo "----------------------------------------"
echo "--- Installing/Updating Neovim ---"
echo "----------------------------------------"
ARCH=$(uname -m)
case $ARCH in
x86_64)
  APPIMAGE_FILENAME="nvim-linux-x86_64.appimage"
  ;;
aarch64 | arm64)
  APPIMAGE_FILENAME="nvim-linux-arm64.appimage"
  ;;
*)
  echo "Unsupported architecture for Neovim AppImage: $ARCH" >&2
  exit 1
  ;;
esac

# Try to get from 'latest' (stable) release first
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/latest/download/${APPIMAGE_FILENAME}"

echo "Attempting to download Neovim from stable release..."
if ! curl -Ls --output /dev/null --head --fail "$DOWNLOAD_URL"; then
  echo "Neovim AppImage for stable release not found for architecture ${ARCH}."
fi

TEMP_DIR=$(mktemp -d)
echo "Installing Neovim, working directory ${TEMP_DIR}..."
echo "Downloading from ${DOWNLOAD_URL}"
curl -Lo "${TEMP_DIR}/${APPIMAGE_FILENAME}" "$DOWNLOAD_URL"

echo "Installing Neovim to /usr/local/bin/nvim..."
sudo chmod +x "${TEMP_DIR}/${APPIMAGE_FILENAME}"
sudo mv "${TEMP_DIR}/${APPIMAGE_FILENAME}" /usr/local/bin/nvim

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
  if command -v zsh &>/dev/null; then
    echo "Changing shell to zsh for user $(whoami)..."
    sudo chsh -s "$(command -v zsh)" "$(whoami)"
    echo "Shell changed to zsh. Please log out and back in for the change to take effect."
  else
    echo "zsh is not installed. Skipping shell change."
  fi
else
  echo "zsh is already the default shell."
fi

echo "All done!" 