#! /usr/bin/bash
echo "Setting up..."

for X in .config .gitconfig .zshrc
do
	echo "Make symlink for" $X
    ln -s ~/.dotfiles/$X ~/$X
done

echo "Done"
