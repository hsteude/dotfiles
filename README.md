# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

The steps below should work on a fresh debian like system

If required:
```shell
sudo apt-get update
sudo apt-get install apt-file -y
sudo apt-file update
```

Install necessary cmd tools
```shell
sudo apt-get install ripgrep neovim fzy git wget curl zsh gcc cowsay fortune -y
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
nvim +'PlugInstall' +qa
nvim +'UpdateRemotePlugins' +qa
```

Install ohmyzsh
```shell
# download ohmyzh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# geht syntax highlighting tool
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# source zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Install python requirements
```shell
source ~/.zshrc
~/miniconda3/bin/conda init zsh
pip install -r ~/dotfiles/nvim/requirements.txt
```

Install nerd fonts to make NerdTree pretty (maybe also download jetbrain mono from jetbrain website and put it to ~/fonts)
```shell
cd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip
cp ./Hurmit*.otf ~/.fonts
fc-cache -fv
```


Install TexLive is neede:
```shell
sudo apt-get install texlive-full
sudo apt install zathura
```


# Install on ec2 ami (pretty old, i guess this needs to be updated, if in doubt use debian/ubunte or similar)
```shell
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install tmux tree ripgrep gcc git wget zsh cowsay fortune-mod.x86_64 -y
git clone https://github.com/jhawthorn/fzy.git
cd fzy; sudo make install; cd
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y neovim
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-Linux-x86_64.sh
cd; git clone https://github.com/hsteude/dotfiles.git
bash ~/dotfiles/create_symlinks.sh
source ~/.bashrc
/usr/local/miniconda/bin/conda init
pip install -r ~/dotfiles/nvim/requirements.txt
echo "let g:python3_host_prog = '$(which python)'" >> ~/dotfiles/nvim/init.vim
echo 'let g:semshi#excluded_buffers = ['*']' >> ~/dotfiles/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall' +'UpdateRemotePlugins' +qa
echo "export PATH=$PATH:~/.local/bin"
```
