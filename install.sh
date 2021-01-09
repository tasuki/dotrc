#!/bin/bash

DOTRC_DIR="dotrc/"
DOTRC_FULL="$HOME/$DOTRC_DIR"

if [ ! -d "$DOTRC_FULL" ]; then
	# clone & change dir
	echo "Cloning..."
	git clone https://github.com/tasuki/dotrc.git "$DOTRC_FULL"
	cd "$DOTRC_FULL"
else
	# change dir & update
	echo "Updating..."
	cd "$DOTRC_FULL"
	git pull
fi

# update modules
git submodule init && git submodule update

# return home
cd ..

# link
SKIP="skipping:   %-17s already points to   %s\n"
BACK="backing up: %-17s moving to           %s\n"
LINK="linking:    %-17s                     %s\n"

for DOTFILE in `ls -dA "$DOTRC_DIR".??*`; do
	# original existing file
	ORIG=`echo "$DOTFILE" | sed "s:$DOTRC_DIR::g"`
	if [ -h "$ORIG" ]; then
		DST=`readlink $ORIG`
		# original is a symlink
		printf "$SKIP" "$ORIG" "$DST"
		continue
	fi

	if [ -e "$ORIG" ]; then
		if [ -d "$ORIG" ]; then
			printf "dunno " "$ORIG"
		else
			# original file exists - move to .orig
			printf "$BACK" "$ORIG" "$ORIG.orig"
			mv "$ORIG"{,.orig}
		fi
	fi
done

cd "$DOTRC_FULL"
stow --verbose --ignore="install.sh|.gitmodules|.git$|.editorconfig" .
