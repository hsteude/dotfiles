#!/bin/bash
mkdir -p ~/.config
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/flake8 ~/.config/flake8
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/zathura ~/.config/zathura
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/.pdbrc.py ~/.pbdrc.py
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
rm ~/.bashrc
ln -s ~/dotfiles/.basrc ~/.basrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# mkdir -p ~/.terminfo/x
# cp ~/dotfiles/xterm-kitty ~/.terminfo/x/

mkdir -p ~/.ipython/profile_default
ln -s ~/dotfiles/ipython_config.py ~/.ipython/profile_default/ipython_config.py
# ln -s ~/dotfiles/keymap.c ~/qmk_firmware/keyboards/planck/keymaps/hsteude/keymap.c
