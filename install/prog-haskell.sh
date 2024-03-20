#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

sudo apt install build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 zlib1g-dev  code

if (command -v ghcup > /dev/null 2>&1); then
	echo "GHCup is already installed"
else
	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

	maybe_append_zshrc ghcup '[ -f "/home/vita/.ghcup/env" ] && . "/home/vita/.ghcup/env" # ghcup-env'
fi

code --install-extension haskell.haskell
