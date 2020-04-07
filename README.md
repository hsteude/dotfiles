# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

The steps below should work on a fresh ubuntu system

If required:
```bash
  sudo apt-get update
  sudo apt-get install apt-file
  sudo apt-file update
```

Install necessary cmd tools
```bash
  sudo apt-get install neovim git wget curl zsh gcc ctags cowsay fortune -y
  ln -s /usr/games/cowsay /usr/bin/cowsay
  ln -s /usr/games/fortune /usr/bin/fortune
  cd; git clone https://github.com/hsteude/dotfiles.git
```

Install Python via miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
Create symlinks
```
bash ~/dotfiles/create_symlinks.sh
```

Install Vim Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install python requirements
```
conda init # you might need add conda to the path
pip install -r ~/dotfiles/nvim/requirements.txt
```



