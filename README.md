# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

The steps below should work on a fresh debian system

If required:
```shell
  sudo apt-get update
  sudo apt-get install apt-file -y
  sudo apt-file update
```

Install necessary cmd tools
```shell
  sudo apt-get install ripgrep neovim fzy git wget curl zsh gcc ctags cowsay fortune lua5.3 -y
  ln -s /usr/games/cowsay /usr/bin/cowsay
  ln -s /usr/games/fortune /usr/bin/fortune
  cd; git clone https://github.com/hsteude/dotfiles.git
```

Install Python via miniconda
```shell
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
Create symlinks
```shell script
bash ~/dotfiles/create_symlinks.sh
```

Install Vim Plug
```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install python requirements
```shell
source ~/.bashrc
conda init # you might need add conda to the path
pip install -r ~/dotfiles/nvim/requirements.txt
```



