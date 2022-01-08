# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

Install necessary cmd tools
```shell
brew install ripgrep neovim fzy git wget curl zsh gcc ctags cowsay fortune lua bat tmux zathura
brew install --cask iterm2 firefow
cd; git clone https://github.com/hsteude/dotfiles.git
for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
git checkout mac_os
```

Install Python via miniconda
```shell
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-MacOSX-x86_64.sh
bash Miniconda3-py39_4.9.2-MacOSX-x86_64.sh
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

Install ohmzsh
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# get syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# source zshrc
mv zsh-syntax-highlighting /usr/local/share
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Install python requirements
```shell
source ~/.zshrc
~/miniconda3/bin/conda init zsh
pip install -r ~/dotfiles/nvim/requirements.txt
```

Installing yabai
```
Quite messy process. Check yabai github wiki!
```

Install pyright
```
brew install pyright
```

Install texlab
```
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

Install node
```
brew install node

```



