# tasuki's `~/.*` files

A personal collection of dotfiles. Let me know if I'm missing anything cool!

## Install

Prereqs, on Debian-based systems: `sudo apt install curl bash git stow`

	curl -s https://raw.githubusercontent.com/tasuki/dotrc/master/install.sh | bash

Clones the repository into `./dotrc/` and links all the dotfiles to current directory.

### Forget-me-not

When using kitty to connect to a new machine, fix the terminfo:

	kitty +kitten ssh user@host

## Credits

Me, you, the internet. Most bits and pieces stolen from one place or another, customized to suit my needs.
