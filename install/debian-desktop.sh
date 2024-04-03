#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/functions.sh"


# tested on Debian 12

echo "1. Installing things from the main repos"
sudo apt install curl bash git stow `# required packages for my dotrc` \
	tmux neovim fzf `# must have cli tools` \
	zsh zsh-autosuggestions zsh-syntax-highlighting `# zsh stuff` \
	bat cloc entr exa fd-find htop jc jq rename ripgrep rlwrap units `# cli tools` \
	kitty vlc geeqie clementine gparted xsel keepassxc `# gui tools` \
	dconf-editor gnome-tweaks gnome-clocks yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon `# gnome` \
	dnsmasq firehol mosh nethogs syncthing `# network tools` \
	default-jre `# jre category by itself?` \
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
code --install-extension EditorConfig.EditorConfig
code --install-extension jock.svg


echo
echo "3. Installing custom debs"

install_deb btm   "https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb"   # coming in trixie: https://packages.debian.org/trixie/btm
install_deb delta "https://github.com/dandavison/delta/releases/download/0.12.1/git-delta_0.12.1_amd64.deb" # coming in trixie: https://packages.debian.org/trixie/git-delta


echo
echo "4. Installing custom binaries"

install_binary sabaki "https://github.com/SabakiHQ/Sabaki/releases/download/v0.52.2/sabaki-v0.52.2-linux-x64.AppImage"
install_binary cgoban.jar "https://files.gokgs.com/javaBin/cgoban.jar"

echo
echo "5. Installing vim plugins"
source "$SCRIPT_DIR/vim.sh"


echo
echo "6. Linking weird command names to normal ones"
link_name fdfind fd
link_name batcat bat
