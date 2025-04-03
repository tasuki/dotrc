#!/bin/bash
set -euo pipefail

sudo apt install npm code

sudo npm install -g \
	elm@0.19.1 \
	elm-test@0.19.1 \
	elm-format@0.8.7 \
	@elm-tooling/elm-language-server@2.8.0

code --install-extension elmtooling.elm-ls-vscode
