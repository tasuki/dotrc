#!/bin/bash

# tested on Debian 12

set -euo pipefail

echo "1. Installing things from the main repos"
sudo apt install curl bash git stow `# required packages for my dotrc` \
	mosh tmux tmuxinator zsh vim neovim htop rlwrap entr rename jq fzf fd-find ripgrep units cloc exa jc `# cli tools` \
	kitty redshift-gtk vlc geeqie clementine flameshot gparted xsel keepassxc `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon `# gnome` \
	nethogs dnsmasq firehol `# system tools` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor`

# tools to keep an eye on:
# miller jless frangipanni

if [ "$(basename "$SHELL")" != "zsh" ]; then
	echo "Changing shell to zsh:"
	[ -f /bin/zsh ] && chsh -s /bin/zsh
fi


echo ""
echo "2. Installing brittle things"

function install {
	if (command -v "$1" > /dev/null 2>&1); then
		echo "$1 is already installed"
	else
		echo "Installing $1..."
		curl -Lo "/tmp/$1.deb" "$2"
		sudo apt install "/tmp/$1.deb"
	fi
}

install btm https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
install delta https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb
install bat https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb


echo
echo "3. Adding custom repositories..."

[ ! -f /usr/share/keyrings/google.gpg.key ] &&
	sudo wget -O /usr/share/keyrings/google.gpg.key  https://dl.google.com/linux/linux_signing_key.pub
[ ! -f /etc/apt/sources.list.d/google-chrome.list ] &&
	echo "deb [signed-by=/usr/share/keyrings/google.gpg.key] http://dl.google.com/linux/chrome/deb/ stable main" | \
		sudo tee /etc/apt/sources.list.d/google-chrome.list

[ ! -f /usr/share/keyrings/dbeaver.gpg.key ] &&
	sudo wget -O /usr/share/keyrings/dbeaver.gpg.key  https://dbeaver.io/debs/dbeaver.gpg.key
[ ! -f /etc/apt/sources.list.d/dbeaver.list ] &&
	echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg.key] https://dbeaver.io/debs/dbeaver-ce /" | \
		sudo tee /etc/apt/sources.list.d/dbeaver.list

[ ! -f /usr/share/keyrings/microsoft.gpg ] &&
	curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
[ ! -f /etc/apt/sources.list.d/vscode.list ] &&
	echo "deb [signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
		sudo tee /etc/apt/sources.list.d/vscode.list

CUSTOM_PACKAGES="code dbeaver-ce google-chrome-stable"
if dpkg -l $CUSTOM_PACKAGES > /dev/null; then
	echo "Packages from custom repositories are already installed"
else
	echo "Install packages from custom repositories"
	sudo apt-get update
	sudo apt-get install $CUSTOM_PACKAGES
fi


echo
echo "4. Sabaki"
if [ -f "$HOME"/.bin/sabaki ]; then
	echo "Already installed"
else
	echo "Installing..."
	wget -O "$HOME"/.bin/sabaki "https://github.com/SabakiHQ/Sabaki/releases/download/v0.52.2/sabaki-v0.52.2-linux-x64.AppImage"
fi
