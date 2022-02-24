# dotfiles, dotfiles, dotfiles

Mostly for python development and some tex stuff. I use zsh as shell and nvim as text editor.

## Installation

Install necessary cmd tools
```shell
brew install ripgrep neovim npm fzy git wget curl zsh gcc ctags cowsay fortune lua bat tmux zathura
brew install --cask iterm2 firefow amethyst
cd; git clone https://github.com/hsteude/dotfiles.git
for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
git checkout mac_os
```

Install Python via miniconda
```shell

```
Create symlinks
```shell script
sh ~/dotfiles/create_symlinks.sh
```

Install Packer
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install zsh highlighting
```shell

# get syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

Install pure promt
```shell
npm install --global pure-prompt
brew install pure
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



