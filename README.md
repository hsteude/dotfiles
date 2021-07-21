# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

The steps below should work on a fresh debian like system

Lets go:
```shell
sudo apt update
sudo apt upgrade
```

Install necessary cmd tools
```shell
sudo apt install ripgrep fzy git neovim wget curl zsh gcc cowsay fortune -y
sudo ln -s /usr/games/cowsay /usr/bin/cowsay
sudo ln -s /usr/games/fortune /usr/bin/fortune
cd; git clone https://github.com/hsteude/dotfiles.git
```

Install / update nvim nightly
```shell
bash ~/dotfiles/update_nvim_nightly.sh
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

Check all symlinks again! The process is a little messy here!

Install python requirements
```shell
source ~/.zshrc
~/miniconda3/bin/conda init zsh
pip install -r ~/dotfiles/nvim/requirements.txt
```

Install pyright as Python LSP (using npm)
```shell
sudo apt install npm
sudo npm install --global pyright
```


Install nerd fonts to make NerdTree pretty (maybe also download jetbrain mono from jetbrain website and put it to ~/fonts)
```shell
cd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip
unzip Hermit.zip
mkdir ~/.fonts 
cp ./Hurmit*.otf ~/.fonts
fc-cache -fv
```


Install TexLive if needed:
```shell
sudo apt-get install texlive-full
sudo apt install zathura
```

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/bin/bat


# Other notes on my setup(
For the Apple Magic Mouse I use it takes a special driver
```shell
cd ~/bin
sudo apt install dkms
git clone https://github.com/RicardoEPRodrigues/Linux-Magic-Trackpad-2-Driver.git
cd Linux-Magic-Trackpad-2-Driver
chmod u+x install.sh
sudo ./install.sh
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
