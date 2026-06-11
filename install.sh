#!/usr/bin/env bash

set -e

case "$(uname)" in
    Darwin)
        ./install-mac.sh
        ;;
    Linux)
        ./install-linux.sh
        ;;
    *)
        echo "Unsupported OS"
        exit 1
        ;;
esac
