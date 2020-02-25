Setup dev environment on devian


if required:
```bash
  sudo apt-get update
  sudo apt-get install apt-file
  sudo apt-file update
```
in any case:
```bash
  sudo apt-get install neovim
```

Install plugin manager 'vim-plugged'
```bash
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install miniconda if required
```
sudo apt-get wget
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
sudo apt-get gcc
```

