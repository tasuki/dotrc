#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

install_binary amm "https://github.com/lihaoyi/ammonite/releases/download/2.5.5/2.13-2.5.5"

code --install-extension scalameta.metals
