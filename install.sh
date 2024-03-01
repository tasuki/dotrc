#!/bin/sh

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

# link
SKIP="skipping:   %-17s already points to   %s\n"
BACK="backing up: %-17s moving to           %s\n"
BDIR="skip dir:   %-17s you might have to move it manually\n"

for DOTFILE in $(ls -dA "$DOTRC_DIR".??*); do
	# original existing file
	ORIG=$(echo "$DOTFILE" | sed "s:$DOTRC_DIR::g")
	if [ -h "$ORIG" ]; then
		DST=$(readlink "$ORIG")
		# original is a symlink
		printf "$SKIP" "$ORIG" "$DST"
		continue
	fi

	if [ -e "$ORIG" ]; then
		if [ -d "$ORIG" ]; then
			printf "$BDIR" "$ORIG"
		else
			# original file exists - move to .orig
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
stow --no-folding --verbose --dotfiles --ignore=".sh$|.gitmodules|.git$|.editorconfig|.vim|.zsh-custom|runbooks$" .

. ./fixnames.sh
