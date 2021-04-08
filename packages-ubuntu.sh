#!/bin/bash

# tested on Ubuntu 20.04

set -euo pipefail

sudo apt install curl bash git stow `# required packages for my dotrc` \
	mosh tmux tmuxinator zsh vim htop jq fzf fd-find ripgrep bat units `# cli tools` \
	kitty redshift-gtk vim-gtk3 vlc geeqie clementine flameshot gparted xsel `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks `# gnome` \
	dnsmasq firehol `# system tools` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor`
