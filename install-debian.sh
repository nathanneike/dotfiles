#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$script_dir"

LOGFILE="$(mktemp)"
declare -a COMPLETED

GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
RESET="\033[0m"

mkdir -p "$HOME/.config" "$HOME/.local/bin"

link_file() {
    ln -sfn "$1" "$2"
}

run() {
    local name="$1"
    local message="$2"
    shift 2

    printf "${BLUE}==>${RESET} %s... " "$message"

    if "$@" >>"$LOGFILE" 2>&1; then
        printf "${GREEN}✓${RESET}\n"
        COMPLETED+=("$message")
    else
        printf "${RED}✗${RESET}\n"
        echo
        echo "Failed during:"
        echo "  $message"
        echo
        echo "Full log:"
        cat "$LOGFILE"
        exit 1
    fi
}

###############################################################################
# Packages
###############################################################################

run apt_update \
    "Updating apt repositories" \
    sudo apt update

run packages \
    "Installing packages" \
    sudo apt install -y \
        git \
        tmux \
        ripgrep \
        fzf \
        zsh \
        nodejs \
        npm \
        python3 \
        python3-pip \
        curl \
        unzip \
        xclip \
        fd-find \
        bat

###############################################################################
# Neovim
###############################################################################

NVIM_VERSION="v0.11.4"
NVIM_URL="https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux-x86_64.tar.gz"

run download \
    "Downloading Neovim ${NVIM_VERSION}" \
    curl -LO "$NVIM_URL"

run remove_old \
    "Removing previous Neovim" \
    rm -rf "$HOME/.local/nvim"

run extract \
    "Extracting Neovim" \
    tar -C "$HOME/.local" -xzf nvim-linux-x86_64.tar.gz

run install \
    "Installing Neovim" \
    mv "$HOME/.local/nvim-linux-x86_64" "$HOME/.local/nvim"

run symlink \
    "Creating Neovim symlink" \
    ln -sfn "$HOME/.local/nvim/bin/nvim" "$HOME/.local/bin/nvim"

run cleanup \
    "Cleaning temporary files" \
    rm nvim-linux-x86_64.tar.gz

###############################################################################
# Pyright
###############################################################################

run pyright \
    "Installing Pyright" \
    sudo npm install -g pyright

###############################################################################
# Convenience symlinks
###############################################################################

if command -v fdfind >/dev/null; then
    run fd \
        "Creating fd symlink" \
        link_file "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

if command -v batcat >/dev/null; then
    run bat \
        "Creating bat symlink" \
        link_file "$(command -v batcat)" "$HOME/.local/bin/bat"
fi

###############################################################################
# Dotfiles
###############################################################################

run nvim \
    "Linking Neovim config" \
    link_file "$repo_root/nvim" "$HOME/.config/nvim"

run tmux \
    "Linking tmux config" \
    link_file "$repo_root/tmux" "$HOME/.config/tmux"

run tmux_legacy \
    "Linking ~/.tmux.conf" \
    link_file "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"

run zshrc \
    "Linking ~/.zshrc" \
    link_file "$repo_root/zshrc/.zshrc" "$HOME/.zshrc"

run zshenv \
    "Linking ~/.zshenv" \
    link_file "$repo_root/zshenv" "$HOME/.zshenv"

run gitconfig \
    "Linking ~/.gitconfig" \
    link_file "$repo_root/git/.gitconfig" "$HOME/.gitconfig"

###############################################################################
# Summary
###############################################################################

echo
echo -e "${GREEN}Bootstrap completed successfully!${RESET}"
echo
echo "Completed steps:"
echo

for step in "${COMPLETED[@]}"; do
    printf "  ${GREEN}✓${RESET} %s\n" "$step"
done

echo
echo "Neovim version:"
"$HOME/.local/bin/nvim" --version | head -1

echo
echo "Log saved to:"
echo "  $LOGFILE"

echo
echo "Run:"
echo "  source ~/.zshrc"
