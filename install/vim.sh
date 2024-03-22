#!/bin/bash
set -euo pipefail

# install vim-plug
[ -f "$HOME/.vim/autoload/plug.vim" ] ||
	curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
		"https://raw.githubusercontent.com/junegunn/vim-plug/0.13.0/plug.vim"

# install the plugins
vim +PlugInstall +PlugClean +qall

# hnng, don't want to fork this, but damn are the all caps tab names annoying
sed --in-place 's/NERD_tree_/tree_/g' "$HOME/.vim/plugged/nerdtree/lib/nerdtree/creator.vim"
