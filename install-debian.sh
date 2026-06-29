set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$script_dir"

mkdir -p "$HOME/.config" "$HOME/.local/bin"

link_file() {
    local source_path="$1"
    local target_path="$2"

    ln -sfn "$source_path" "$target_path"
}

run_as_root() {
    if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
        "$@"
    elif command -v sudo >/dev/null 2>&1; then
        sudo "$@"
    else
        "$@"
    fi
}

install_packages_apt() {
    run_as_root apt-get update
    run_as_root apt-get install -y \
        git \
        neovim \
        tmux \
        ripgrep \
        fzf \
        zsh \
        nodejs \
        npm \
        python3 \
        python3-pip \
        curl

    for package in fd-find bat eza; do
        run_as_root apt-get install -y "$package" || true
    done
}

install_packages_dnf() {
    run_as_root dnf install -y \
        git \
        neovim \
        tmux \
        ripgrep \
        fzf \
        zsh \
        nodejs \
        npm \
        python3 \
        python3-pip \
        curl

    for package in fd-find bat eza; do
        run_as_root dnf install -y "$package" || true
    done
}

install_packages_pacman() {
    run_as_root pacman -Sy --noconfirm \
        git \
        neovim \
        tmux \
        ripgrep \
        fzf \
        zsh \
        nodejs \
        npm \
        python \
        python-pip \
        curl

    for package in fd bat eza; do
        run_as_root pacman -S --noconfirm "$package" || true
    done
}

install_packages_zypper() {
    run_as_root zypper install -y \
        git \
        neovim \
        tmux \
        ripgrep \
        fzf \
        zsh \
        nodejs \
        npm \
        python3 \
        python3-pip \
        curl

    for package in fd bat eza; do
        run_as_root zypper install -y "$package" || true
    done
}

case "${PKG_MANAGER:-}" in
    apt)
        install_packages_apt
        ;;
    dnf)
        install_packages_dnf
        ;;
    pacman)
        install_packages_pacman
        ;;
    zypper)
        install_packages_zypper
        ;;
    "")
        if command -v apt-get >/dev/null 2>&1; then
            install_packages_apt
        elif command -v dnf >/dev/null 2>&1; then
            install_packages_dnf
        elif command -v pacman >/dev/null 2>&1; then
            install_packages_pacman
        elif command -v zypper >/dev/null 2>&1; then
            install_packages_zypper
        else
            echo "No supported package manager found; skipping package install"
        fi
        ;;
    *)
        echo "Unsupported package manager: $PKG_MANAGER"
        exit 1
        ;;
esac

if command -v npm >/dev/null 2>&1; then
    run_as_root npm install -g pyright
fi

if command -v fdfind >/dev/null 2>&1; then
    link_file "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

if command -v batcat >/dev/null 2>&1; then
    link_file "$(command -v batcat)" "$HOME/.local/bin/bat"
fi

link_file "$repo_root/nvim" "$HOME/.config/nvim"
link_file "$repo_root/tmux" "$HOME/.config/tmux"
link_file "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$repo_root/zshrc/.zshrc" "$HOME/.zshrc"
link_file "$repo_root/zshenv" "$HOME/.zshenv"
link_file "$repo_root/git/.gitconfig" "$HOME/.gitconfig"
