#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"

if [ -f /etc/os-release ]; then
	. /etc/os-release
else
	echo "Can't find /etc/os-release, this won't work here"
	exit 1
fi

# tested on Debian 12

echo "1. Installing things from the main repos"
sudo apt install curl bash git stow `# required packages for my dotrc` \
	tmux neovim fzf fd-find ripgrep `# must have cli tools` \
	zsh zsh-autosuggestions zsh-syntax-highlighting `# zsh stuff` \
	htop btop `# monitoring` \
	exa nnn fd-find renameutils `# file ops` \
	bat cloc git-delta jc jq miller visidata `# reading/displaying data` \
	entr rlwrap units `# utils` \
	kitty vim-gtk3 geeqie clementine vlc gparted xsel keepassxc `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon `# gnome` \
	dnsmasq firehol mosh nethogs syncthing `# network tools` \
	default-jre `# jre category by itself?` \
	gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 `# system monitor` \

if (( VERSION_ID > 12 )); then
	sudo apt install btm lsd
fi

# tools to keep an eye on:
# jless frangipanni

if [ "$(basename "$SHELL")" != "zsh" ]; then
	echo "Changing shell to zsh:"
	[ -f /bin/zsh ] && chsh -s /bin/zsh
fi


echo
echo "2. Adding custom repositories..."

repo_with_gpg_key \
	"google.gpg.key"     "https://dl.google.com/linux/linux_signing_key.pub" \
	"google-chrome.list" "https://dl.google.com/linux/chrome/deb/ stable main"

# Using install_binary for now...
# repo_with_gpg_key \
# 	"jdx-mise.gpg.key"   "https://mise.jdx.dev/gpg-key.pub" \
# 	"jdx-mise.list"      "https://mise.jdx.dev/deb stable main"

CUSTOM_PACKAGES="google-chrome-stable"
if dpkg -l $CUSTOM_PACKAGES > /dev/null; then
	echo "Packages from custom repositories are already installed"
else
	echo "Install packages from custom repositories"
	sudo apt-get update
	sudo apt-get install $CUSTOM_PACKAGES
fi


echo
echo "3. Installing custom debs"

# install_deb btm   "https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb"   # coming in trixie: https://packages.debian.org/trixie/btm
# install_deb delta "https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb" # coming in trixie: https://packages.debian.org/trixie/git-delta


echo
echo "4. Installing custom binaries"

install_binary mise \
	"https://github.com/jdx/mise/releases/download/v2025.4.1/mise-v2025.4.1-linux-x64" \
	"670b182430d20a5c9dbfcce0af7ff64b87f62938b62663c5ca5f7661c067fe9b"
mise use -g usage

install_binary sabaki \
	"https://github.com/SabakiHQ/Sabaki/releases/download/v0.52.2/sabaki-v0.52.2-linux-x64.AppImage" \
	"c2e0a3e47bcd65cd8a39d7393b8f6ea4d4e81432a230c59ec7291cb478b9d446"

install_binary cgoban.jar \
	"https://files.gokgs.com/javaBin/cgoban.jar" \
	"7a137f690536dd912d0e1ffeaf71f63c33c1ad6860a0c7e011f2aae6ad3c9056"

echo
echo "5. Installing vim plugins"
source "$SCRIPT_DIR/vim.sh"


echo
echo "6. Linking weird command names to normal ones"
link_name fdfind fd
link_name batcat bat

echo "7. Register custom keyboard"
sudo dpkg-reconfigure xkb-data # also Gnome logout/login 🤮
