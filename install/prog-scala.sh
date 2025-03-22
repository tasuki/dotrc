#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

sudo apt install default-jdk

install_binary amm "https://github.com/com-lihaoyi/Ammonite/releases/download/3.0.2/3.5-3.0.2"

code --install-extension scalameta.metals
