#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

sudo apt install default-jdk

mise use --global coursier@2.1.24
cs install scala:3.6.4 scalac:3.6.4 ammonite:3.0.2
maybe_append_zshrc coursier 'export PATH="$PATH:$HOME/.local/share/coursier/bin"'

command -v code > /dev/null 2>&1 && code --install-extension scalameta.metals
