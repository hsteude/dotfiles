#!/bin/bash
cd
mv nvim.appimage nvim.appimage.backup
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage 
mv nvim.appimage /usr/local/bin/
