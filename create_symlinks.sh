#!/bin/bash
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
rm ~/.bashrc
rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
#mkdir .config/
ln -s ~/dotfiles/nvim ~/.config/
ln -s ~/dotfiles/zathura ~/.config/
ln -s ~/dotfiles/.pdbrc.py ~/.pbdrc.py
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
#ln -s ~/dotfiles/keymap.c ./keyboards/planck/keymaps/hsteude/keymap.c
#the git config already existed.. probably cause i cloned using the ssh key...
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.condarc ~/.condarc
ln -s ~/dotfiles/own.zsh-theme ~/.oh-my-zsh/themes/own.zsh-theme
ln -s ~/dotfiles/ipython_config.py ~/.ipython/profile_default/ipython_config.py
