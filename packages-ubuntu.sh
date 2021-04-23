#!/bin/bash

# tested on Ubuntu 20.04

set -euo pipefail

sudo apt install curl bash git stow `# required packages for my dotrc` \
	mosh tmux tmuxinator zsh vim htop jq fzf fd-find ripgrep bat units `# cli tools` \
	kitty redshift-gtk vim-gtk3 vlc geeqie clementine flameshot gparted xsel `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks `# gnome` \
	dnsmasq firehol `# system tools` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor`

echo ""
echo "Installing brittle things"

if (command -v delta > /dev/null 2>&1); then
	echo "delta is already installed"
else
	# yes sure hardcode the architecture what could possibly ever go wrong?
	# in defense: `uname -m` outputs `x86_64` so no way to automate this easily?
	curl -Lo /tmp/git-delta.deb https://github.com/dandavison/delta/releases/download/0.7.1/git-delta_0.7.1_amd64.deb
	sudo apt install /tmp/git-delta.deb
fi
