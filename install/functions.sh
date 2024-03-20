#!/bin/bash
set -euo pipefail

function repo_with_gpg_key {
	KEYRING="/usr/share/keyrings/$1"
	APT_SOURCE="/etc/apt/sources.list.d/$3"

	[ -f "$KEYRING" ] ||
		sudo wget -O "$KEYRING" "$2"
	[ -f "$APT_SOURCE" ] ||
		echo "dev [signed-by=$KEYRING] $4" | sudo tee "$APT_SOURCE"
}

function repo_with_asc_key {
	KEYRING="/usr/share/keyrings/$1"
	APT_SOURCE="/etc/apt/sources.list.d/$3"

	[ -f "$KEYRING" ] ||
		curl -fsSL "$2" | sudo gpg --dearmor -o "$KEYRING"
	[ -f "$APT_SOURCE" ] ||
		echo "dev [signed-by=$KEYRING] $4" | sudo tee "$APT_SOURCE"
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

function maybe_append_zshrc {
	grep -q "$1" ~/.zshrc.local ||
		echo "$2" >> ~/.zshrc.local
}
