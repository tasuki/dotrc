#!/bin/bash
set -euo pipefail

find ~ -maxdepth 1 -type l ! -exec test -e {} \; -print -delete
