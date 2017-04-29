#!/bin/sh


REPO_BASE="$(dirname "$PWD/$0")"
REPO_VIM="$(readlink -f $REPO_BASE/vimrc)"

DEST="$HOME/.vimrc"

echo "checking for updates..."
git -C $REPO_BASE pull

if [ ! -e $DEST ] && [ ! -L $DEST ]; then
	echo "linking $DEST with $REPO_VIM"
	ln -s $REPO_VIM $DEST
else
	if [ -L $DEST ]; then
		if [ $(readlink $DEST) = $(echo $REPO_VIM) ]; then
			echo "new .vimrc already installed"
		else
			echo "removing old $DEST pointing at $(readlink $DEST)"
			unlink $DEST
			echo "linking $DEST with $REPO_VIM"
			ln -s $REPO_VIM $DEST
		fi
	else
		echo "linking $DEST with $REPO_VIM"
		cat $DEST >> "$HOME/.old.vimrc"
		echo "old $DEST content is now in $HOME/.old.vimrc"
		rm $DEST
		ln -s $REPO_VIM $DEST
	fi
fi

[ ! -e ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Done"
