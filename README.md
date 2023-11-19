# dotfiles, dotfiles, dotfiles

Mostly for python development and some TeX stuff. I use zsh as shell and nvim
as text editor.

## Installation (asuming mac os for now)
E.g. on a fresh ubuntu, you need:
gcc+, npm, 
node -v > 14
Install necessary cmd tools
```shell
brew install ripgrep neovim npm fzy git wget curl zsh gcc lua tmux
brew install --cask iterm2 firefow amethyst
cd; git clone https://github.com/hsteude/dotfiles.git
```

Create symlinks
```shell script
sh ~/dotfiles/create_symlinks.sh
```

Install starship prompt
```sh
curl -sS https://starship.rs/install.sh | sh
```



Cargo and node if needed:
```
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```
Install node
```
brew install node

```

## If on mac os, tmux-256color terminfo needs to be installed
```sh
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
/usr/bin/tic -xe tmux-256color terminfo.src
```


