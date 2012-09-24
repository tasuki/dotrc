#!/bin/bash
# clone change update return link clean exit

DOTRC_DIR="dotrc"

# clone
git clone https://github.com/tasuk/dotrc.git "$DOTRC_DIR" &&
# change
cd "$DOTRC_DIR" &&

# update
git submodule init && git submodule update &&
# return
cd .. &&

# link
for DOTFILE in `ls -dA "$DOTRC_DIR"/.??* | grep -v "\(.gitmodules\|.git$\)"`; do
	ln -s "$DOTFILE"
done
# clean
unset DOTRC_DIR DOTFILE
# exit
