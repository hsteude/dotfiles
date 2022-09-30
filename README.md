# dotfiles, dotfiles, dotfiles

Mostly for python development and some TeX stuff. I use zsh as shell and nvim
as text editor.

## Installation
E.g. on a fresh ubuntu, you need:
gcc+, npm, 
node -v > 14
Install necessary cmd tools
```shell
brew install ripgrep neovim npm fzy git wget curl zsh gcc cowsay fortune lua tmux
brew install --cask iterm2 firefow amethyst
cd; git clone https://github.com/hsteude/dotfiles.git
for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
git checkout mac_os
```

Create symlinks
```shell script
sh ~/dotfiles/create_symlinks.sh
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

Cargo and node if needed:
```
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```
Install node
```
brew install node

```



