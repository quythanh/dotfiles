#! /usr/bin/bash
echo "Setting up..."

for X in .config .zshrc; do
	echo "Make symlink for" $X
	ln -s ~/.dotfiles/$X ~/$X
done

echo "Cloning p10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/.oh-my-zsh/custom/themes/powerlevel10k

echo "Done"
