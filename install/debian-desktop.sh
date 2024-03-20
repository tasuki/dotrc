#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"


# tested on Debian 12

echo "1. Installing things from the main repos"
sudo apt install curl bash git stow `# required packages for my dotrc` \
	mosh tmux zsh vim neovim htop rlwrap entr rename jq fzf fd-find ripgrep units cloc exa jc `# cli tools` \
	kitty vlc geeqie clementine gparted xsel keepassxc `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon `# gnome` \
	nethogs dnsmasq firehol syncthing default-jre `# system tools` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor` \

# tools to keep an eye on:
# miller jless frangipanni

if [ "$(basename "$SHELL")" != "zsh" ]; then
	echo "Changing shell to zsh:"
	[ -f /bin/zsh ] && chsh -s /bin/zsh
fi


echo
echo "2. Adding custom repositories..."

repo_with_gpg_key \
	"google.gpg.key"     "https://dl.google.com/linux/linux_signing_key.pub" \
	"google-chrome.list" "https://dl.google.com/linux/chrome/deb/ stable main"

repo_with_gpg_key \
	"dbeaver.gpg.key" "https://dbeaver.io/debs/dbeaver.gpg.key" \
	"dbeaver.list"    "https://dbeaver.io/debs/dbeaver-ce /"

repo_with_asc_key \
	"microsoft.gpg" "https://packages.microsoft.com/keys/microsoft.asc" \
	"vscode.list"   "https://packages.microsoft.com/repos/code stable main"


CUSTOM_PACKAGES="code dbeaver-ce google-chrome-stable"
if dpkg -l $CUSTOM_PACKAGES > /dev/null; then
	echo "Packages from custom repositories are already installed"
else
	echo "Install packages from custom repositories"
	sudo apt-get update
	sudo apt-get install $CUSTOM_PACKAGES
fi

code --install-extension vscodevim.vim
code --install-extension ryu1kn.annotator


echo ""
echo "2. Installing custom debs"

install_deb btm   "https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb"
install_deb delta "https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb"
install_deb bat   "https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb"

echo
echo "4. Installing custom binaries"

install_binary sabaki "https://github.com/SabakiHQ/Sabaki/releases/download/v0.52.2/sabaki-v0.52.2-linux-x64.AppImage"
install_binary cgoban.jar "https://files.gokgs.com/javaBin/cgoban.jar"
