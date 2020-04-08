#!/bin/bash
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
mkdir .config/
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.pdbrc.py ~/.pbdrc.py
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
