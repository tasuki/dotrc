#!/bin/bash
set -euo pipefail

function repo_with_gpg_key {
	KEYRING="/usr/share/keyrings/$1"
	APT_SOURCE="/etc/apt/sources.list.d/$3"

	[ -f "$KEYRING" ] ||
		sudo wget -O "$KEYRING" "$2"
	[ -f "$APT_SOURCE" ] ||
		echo "deb [signed-by=$KEYRING] $4" | sudo tee "$APT_SOURCE"
}

function repo_with_asc_key {
	KEYRING="/usr/share/keyrings/$1"
	APT_SOURCE="/etc/apt/sources.list.d/$3"

	[ -f "$KEYRING" ] ||
		curl -fsSL "$2" | sudo gpg --dearmor -o "$KEYRING"
	[ -f "$APT_SOURCE" ] ||
		echo "deb [signed-by=$KEYRING] $4" | sudo tee "$APT_SOURCE"
}

function install_deb {
	if (command -v "$1" > /dev/null 2>&1); then
		echo "$1 is already installed"
	else
		echo "Installing $1..."
		wget -O "/tmp/$1.deb" "$2"
		sudo apt install "/tmp/$1.deb"
	fi
}

function install_binary {
	mkdir -p "$HOME/.local/bin/"
	DEST="$HOME/.local/bin/$1"
	if [ -f "$DEST" ]; then
		echo "$1 is already in $DEST"
	else
		echo "Installing $1..."
		wget -O "$DEST" "$2"
		chmod 755 "$DEST"
	fi
}

# Links the second parameter to the first one.
# If the second parameter doesn't exist && the first one does.
link_name() {
	if ! (command -v "$2" > /dev/null 2>&1); then
		echo "$2 not found!"
		if command -v "$1" > /dev/null 2>&1; then
			echo "  ...and $1 found, linking to $HOME/.bin/$2"
			ln -s "$(command -v "$1")" "$HOME/.bin/$2"
		fi
	fi
}

function maybe_append_zshrc {
	grep -q "$1" ~/.zshrc.local ||
		echo "$2" >> ~/.zshrc.local
}
