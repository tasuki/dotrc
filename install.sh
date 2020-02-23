#!/bin/bash
# clone change update return link clean exit

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

# return
cd .. &&

# link
SKIP="skipping:   %-17s already points to   %s\n"
BACK="backing up: %-17s moving to           %s\n"
LINK="linking:    %-17s                     %s\n"

for DOTFILE in `ls -dA "$DOTRC_DIR".??* | grep -v "\(.gitmodules\|.git$\|.editorconfig\)"`; do
	# original existing file
	ORIG=`echo "$DOTFILE" | sed "s:$DOTRC_DIR::g"`
	if [ -h "$ORIG" ]; then
		DST=`readlink $ORIG`
		# original is a symlink
		printf "$SKIP" "$ORIG" "$DST"
		continue
	fi

	if [ -e "$ORIG" ]; then
		# original exists - move to .orig
		printf "$BACK" "$ORIG" "$ORIG.orig"
		mv "$ORIG"{,.orig}
	fi
	printf "$LINK" "" "$DOTFILE"
	ln -s "$DOTFILE"
done

# clean
unset DOTRC_DIR DOTRC_FULL DOTFILE SKIP BACK LINK ORIG DST

# exit
