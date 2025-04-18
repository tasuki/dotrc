#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

sudo apt install haskell-stack

mise use --global ghcup@0.1.50.1
maybe_append_zshrc ghcup '[ -f "$HOME/.ghcup/bin" ] && . "$HOME/.ghcup/bin"'

command -v code > /dev/null 2>&1 && code --install-extension haskell.haskell
