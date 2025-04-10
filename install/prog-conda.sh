#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

repo_with_asc_key \
	"conda-archive-keyring.gpg" "https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc" \
	"conda.list"                "https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main"

sudo apt update
sudo apt install conda

maybe_append_zshrc conda "source /opt/conda/etc/profile.d/conda.sh  # unbreak conda"
