#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname)" in
    Darwin)
        exec "$script_dir/install-mac.sh"
        ;;
    Linux)
        exec "$script_dir/install-linux.sh"
        ;;
    *)
        echo "Unsupported OS"
        exit 1
        ;;
esac
