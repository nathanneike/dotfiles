#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$script_dir"

mkdir -p "$HOME/.config"

link_file() {
    local source_path="$1"
    local target_path="$2"

    ln -sfn "$source_path" "$target_path"
}

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

link_file "$repo_root/nvim" "$HOME/.config/nvim"
link_file "$repo_root/tmux" "$HOME/.config/tmux"
link_file "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$repo_root/zshrc/.zshrc" "$HOME/.zshrc"
link_file "$repo_root/zshenv" "$HOME/.zshenv"
link_file "$repo_root/git/.gitconfig" "$HOME/.gitconfig"
