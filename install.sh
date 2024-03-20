#!/bin/bash
set -euo pipefail

DOTRC_DIR="dotrc/"
DOTRC_FULL="$HOME/$DOTRC_DIR"

if [ ! -d "$DOTRC_FULL" ]; then
	# clone & change dir
	echo "Cloning..."
	git clone https://github.com/tasuki/dotrc.git "$DOTRC_FULL"
	cd "$DOTRC_FULL" || exit 1
else
	# change dir & update
	echo "Updating..."
	cd "$DOTRC_FULL" || exit 1
	git pull
fi

# update modules
git submodule init && git submodule update

cd "$HOME" || exit 1

# back up conflicting files
BACK="backing up: %-17s moving to %s\n"
for DOTFILE in $(ls -dA "$DOTRC_DIR".??*); do
	# potential original existing file
	ORIG=$(echo "$DOTFILE" | sed "s:$DOTRC_DIR::g")
	if [ ! -h "$ORIG" ]; then # not a symlink
		if [ -f "$ORIG" ]; then # is a file
			printf "$BACK" "$ORIG" "$ORIG.orig"
			mv "$ORIG" "$ORIG.orig"
		fi
	fi
done

# link whole directories for vim and zsh
[ ! -d .vim ] && ln -s dotrc/.vim/
[ ! -d .zsh-custom ] && ln -s dotrc/.zsh-custom/

# link individual files for the rest
cd "$DOTRC_FULL" || exit 1
stow --no-folding --verbose --dotfiles --ignore=".sh$|^install$|^.gitmodules$|^.git$|^.editorconfig$|^.vim$|^.zsh-custom$|^runbooks$" .

. ./install/fixnames.sh
