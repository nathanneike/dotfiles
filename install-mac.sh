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
mkdir -p ~/.config

ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/tmux ~/.config/tmux
ln -sfn ~/.config/tmux/tmux.conf ~/.tmux.conf# Legacy tmux location
ln -sfn ~/.config/tmux/tmux.conf ~/.tmux.conf

echo "macOS setup complete."
