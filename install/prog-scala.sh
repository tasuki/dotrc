#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

sudo apt install default-jdk

install_binary amm \
	"https://github.com/com-lihaoyi/Ammonite/releases/download/3.0.2/3.5-3.0.2" \
	"bf4cc5e27fbb278725093d43d57fc0ffd2f7f7fbbdc7f54a2d1237bac324aa9e"

code --install-extension scalameta.metals
