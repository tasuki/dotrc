#!/bin/bash
set -euo pipefail

DOTRC_FULL="$HOME/dotrc/"

if [ ! -d "$DOTRC_FULL" ]; then
	# clone & change dir
	echo "Cloning..."
	git clone https://github.com/tasuki/dotrc.git "$DOTRC_FULL"
	cd "$DOTRC_FULL"
else
	# change dir & update
	echo "Updating..."
	cd "$DOTRC_FULL"
	git pull
fi

# update modules
git submodule init && git submodule update

source ./install/link-files.sh
