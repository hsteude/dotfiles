#!/bin/bash
cd ~/bin
mv nvim.appimage nvim.appimage.backup
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x ~/bin/nvim.appimage 
