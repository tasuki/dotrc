#!/bin/bash
set -euo pipefail

cd "$HOME"
export DOTRC_DIR="dotrc/"

# back up conflicting files
BACK="backing up: %-17s moving to %s\n"
for DOTFILE in $(ls -dA "$DOTRC_DIR".??*); do
	# potential original existing file
	ORIG=${DOTFILE//$DOTRC_DIR/}

	if [ ! -h "$ORIG" ]; then # not a symlink
		if [ -f "$ORIG" ]; then # is a file
			echo "$BACK" "$ORIG" "$ORIG.orig"
			mv "$ORIG" "$ORIG.orig"
		fi
	fi
done

# link whole directories for vim and zsh
[ ! -d .vim ] && ln -s dotrc/.vim/ .
[ ! -d .zsh-custom ] && ln -s dotrc/.zsh-custom/ .

# link individual files for the rest
cd "$DOTRC_DIR"
stow --no-folding --verbose --dotfiles --ignore=".sh$|^install$|^.git$|^.editorconfig$|^.vim$|^.zsh-custom$" .
