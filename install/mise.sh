#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

install_binary mise \
	"https://github.com/jdx/mise/releases/download/v2026.7.14/mise-v2026.7.14-linux-x64" \
	"fc96308f4fa085d7359892ac6351ededb35ecfabf1ddc34f5757bc755a2af8a6"
mise use -g usage@7.1.0
