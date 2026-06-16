#!/usr/bin/env bash

set -euo pipefail

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
    pyenv \
    uv \
    gh

npm install -g pyright

mkdir -p ~/.config

ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/tmux ~/.config/tmux
ln -sfn ~/.config/tmux/tmux.conf ~/.tmux.conf
