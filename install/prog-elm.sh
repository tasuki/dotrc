#!/bin/bash
set -euo pipefail

sudo apt install npm code

sudo npm install -g elm@latest-0.19.1 elm-test@latest-0.19.1 elm-format@0.8.7

code --install-extension elmtooling.elm-ls-vscode
