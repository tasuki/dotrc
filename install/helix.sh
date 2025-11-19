#!/bin/bash
set -euo pipefail

sudo apt install hx

# Debian doesn't include tree sitter grammars
hx --grammar fetch
hx --grammar build
