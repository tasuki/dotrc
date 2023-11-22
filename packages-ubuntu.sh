#!/bin/bash

# tested on Ubuntu 20.04

set -euo pipefail

sudo apt install curl bash git stow `# required packages for my dotrc` \
	mosh tmux tmuxinator zsh vim htop rlwrap entr rename jq fzf fd-find ripgrep units cloc `# cli tools` \
	kitty redshift-gtk vlc geeqie clementine flameshot gparted xsel keepassxc `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks `# gnome` \
	nethogs dnsmasq firehol `# system tools` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor`

# tools to try on newer system:
# exa jc

# tools to keep an eye on:
# miller jless frangipanni

echo ""
echo "Installing brittle things"

function install {
	if (command -v "$1" > /dev/null 2>&1); then
		echo "$1 is already installed"
	else
		curl -Lo "/tmp/$1.deb" "$2"
		sudo apt install "/tmp/$1.deb"
	fi
}

install delta https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb
install bat https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb

[ -f /bin/zsh ] && chsh -s /bin/zsh

echo ""
echo "Installing some snaps"

sudo snap install dbeaver-ce
sudo snap install intellij-idea-community --channel=2022.3/stable
sudo snap install node --channel=18/stable --classic
sudo snap install nvim
sudo snap install bottom
sudo snap install sabaki

sudo snap connect bottom:mount-observe
sudo snap connect bottom:hardware-observe
sudo snap connect bottom:system-observe
sudo snap connect bottom:process-control

# Remove old versions of snaps:
# snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then snap remove "$snapname" --revision="$rev"; fi; done
