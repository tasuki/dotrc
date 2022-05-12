#!/bin/sh

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

link_name fdfind fd
link_name batcat bat
