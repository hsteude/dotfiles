git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make  CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
echo 'export PATH="$HOME/neovim/bin:$PATH"' >> .zshrc
cd ~
