# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nneovim as text editor.

## Installation

The steps below should work on a fresh fedora OS.
You can also find a branch for debian like systems in this repo.
However, it's still a little bumpy here and there. So be patient :)


Lets go and update all all packages:
```shell
sudo dnf update -y
```

Install necessary cmd tools
```shell
sudo dnf install ripgrep git neovim wget curl zsh gcc cowsay fortune-mod -y
sudo dnf install dnf-plugins-core
sudo dnf copr enable lehrenfried/fzy
sudo dnf install fzy -y

cd; git clone https://github.com/hsteude/dotfiles.git
```


Install Python via miniconda
```shell
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash miniconda3-latest-linux-x86_64.sh
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
```

Install pyright as Python LSP (using npm)
```shell
sudo dnf install npm
sudo npm install --global pyright
```

Create symlinks
```shell script
bash ~/dotfiles/create_symlinks.sh
```

Install python requirements (for using nvim as IDE)
```shell
pip install -r ~/dotfiles/nvim/requirements.txt
```
    
Create an ipython profile
```shell
ipython profile create
rm ~/.ipython/profile_default/ipython_config.py # remove default file
ln -s ~/dotfiles/ipython_config.py ~/.ipython/profile_default/ipython_config.py
```

Install Jetbrain mono fonts:
```shell
sudo dnf copr enable elxreno/jetbrains-mono-fonts -y && sudo dnf install jetbrains-mono-fonts -y
```

Install TexLive if needed:
```shell
sudo dnf install texlive-scheme-full -y
sudo apt install zathura
# we need rust to build taxlab from source (the lsp server for tex)
sudo dnf install rust cargo
cargo install --git https://github.com/latex-lsp/texlab.git --locked
sudo mv ~/.cargo/bin/texlab /usr/local/bin/

```

# LanguageTool
curl -L https://raw.githubusercontent.com/languagetool-org/languagetool/master/install.sh | sudo bash
sudo mv LanguageTool-5.4-stable /usr/local/bin
sudo dnf install java-latest-openjdk.x86_64


# Other notes on my setup()
Neither the teams-for-linux app nor the default chromium browser where able to
smoothly run MS-Teams (either no video or no screen sharing...).
The issue is the missing wayland support (I guess)
In this [article](https://uwot.eu/blog/microsoft-teams-on-fedora-and-wayland-with-screenshare/) I found a way to get it running using chromium-freeworld and
pipewire.

