#!/bin/bash
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/flake8 ~/.config/flake8
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.pdbrc.py ~/.pbdrc.py
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
mkdir -p ~/.ipython/profile_default
ln -s ~/dotfiles/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/.yabairc ~/.yabairc
ln -s ~/dotfiles/keymap.c ~/qmk_firmware/keyboards/planck/keymaps/hsteude/keymap.c
