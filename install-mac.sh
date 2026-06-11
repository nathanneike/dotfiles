#!/usr/bin/env bash
set -euo pipefail

#Homebrew packages
brew install \
    git \
    neovim \
    tmux \
    ripgrep \
    fd \
    fzf \
    bat \
    eza \
    node \
    pyenv

#Python LSP
npm install -g basedpyright

#Create config directories
mkdir -p ~/config

#symlink config
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/tmux ~/.config/tmux

# Legacy tmux location
ln -sfn ~/.config/tmux/tmux.conf ~/.tmux.conf

echo "macOS setup complete."
