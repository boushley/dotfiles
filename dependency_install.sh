#!/usr/bin/env bash

set -euo pipefail

# Install the command-line tools initialized by zsh/zshrc. Tools installed by
# their upstream scripts are placed in ~/bin, which setup_links.sh adds to PATH.

BIN_DIR="${HOME}/bin"
FZF_DIR="${HOME}/.local/share/fzf"
TEMP_DIR=""

log() {
  printf '\n==> %s\n' "$1"
}

cleanup() {
  if [[ -n "${TEMP_DIR}" && -d "${TEMP_DIR}" ]]; then
    rm -rf "${TEMP_DIR}"
  fi
}
trap cleanup EXIT

as_root() {
  if [[ "$(id -u)" -eq 0 ]]; then
    "$@"
  elif command -v sudo >/dev/null 2>&1; then
    sudo "$@"
  else
    printf 'Error: sudo is required to install system packages.\n' >&2
    exit 1
  fi
}

install_system_dependencies() {
  log "Installing system dependencies"

  if command -v brew >/dev/null 2>&1; then
    brew install zsh curl git
  elif command -v apt-get >/dev/null 2>&1; then
    as_root apt-get update
    as_root apt-get install -y zsh curl git ca-certificates
  elif command -v dnf >/dev/null 2>&1; then
    as_root dnf install -y zsh curl git ca-certificates
  elif command -v yum >/dev/null 2>&1; then
    as_root yum install -y zsh curl git ca-certificates
  elif command -v pacman >/dev/null 2>&1; then
    as_root pacman -Sy --needed --noconfirm zsh curl git ca-certificates
  elif command -v zypper >/dev/null 2>&1; then
    as_root zypper --non-interactive install zsh curl git ca-certificates
  elif command -v apk >/dev/null 2>&1; then
    as_root apk add zsh curl git ca-certificates
  elif command -v zsh >/dev/null 2>&1 &&
       command -v curl >/dev/null 2>&1 &&
       command -v git >/dev/null 2>&1; then
    printf 'zsh, curl, and git are already available.\n'
  else
    printf 'Error: no supported package manager was found.\n' >&2
    printf 'Install zsh, curl, git, and CA certificates, then rerun this script.\n' >&2
    exit 1
  fi
}

download_installer() {
  local url="$1"
  local destination="$2"

  curl --fail --location --silent --show-error \
    --output "${destination}" "${url}"
}

install_fzf() {
  if command -v fzf >/dev/null 2>&1 && fzf --zsh >/dev/null 2>&1; then
    printf 'fzf is already installed and supports zsh integration.\n'
    return
  fi

  log "Installing fzf"
  mkdir -p "$(dirname "${FZF_DIR}")"
  if [[ -d "${FZF_DIR}/.git" ]]; then
    git -C "${FZF_DIR}" pull --ff-only
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_DIR}"
  fi
  "${FZF_DIR}/install" --bin
  ln -sfn "${FZF_DIR}/bin/fzf" "${BIN_DIR}/fzf"
}

install_starship() {
  if command -v starship >/dev/null 2>&1; then
    printf 'starship is already installed.\n'
    return
  fi

  log "Installing starship"
  download_installer https://starship.rs/install.sh "${TEMP_DIR}/starship.sh"
  sh "${TEMP_DIR}/starship.sh" --yes --bin-dir "${BIN_DIR}"
}

install_mise() {
  if command -v mise >/dev/null 2>&1; then
    printf 'mise is already installed.\n'
    return
  fi

  log "Installing mise"
  download_installer https://mise.run "${TEMP_DIR}/mise.sh"
  MISE_INSTALL_PATH="${BIN_DIR}/mise" sh "${TEMP_DIR}/mise.sh"
}

install_zoxide() {
  if command -v zoxide >/dev/null 2>&1; then
    printf 'zoxide is already installed.\n'
    return
  fi

  log "Installing zoxide"
  download_installer \
    https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh \
    "${TEMP_DIR}/zoxide.sh"
  sh "${TEMP_DIR}/zoxide.sh" \
    --bin-dir "${BIN_DIR}" \
    --man-dir "${HOME}/.local/share/man"
}

main() {
  case "$(uname -s)" in
    Darwin | Linux) ;;
    *)
      printf 'Error: this script currently supports macOS and Linux.\n' >&2
      exit 1
      ;;
  esac

  install_system_dependencies
  mkdir -p "${BIN_DIR}"
  TEMP_DIR="$(mktemp -d)"

  # Make freshly installed commands visible during this run.
  export PATH="${BIN_DIR}:${PATH}"

  install_fzf
  install_starship
  install_mise
  install_zoxide

  log "Done"
  printf 'Installed zsh, fzf, starship, mise, and zoxide.\n'
  printf 'Open a new shell (or source ~/.zshrc) to activate them.\n'
}

main "$@"
