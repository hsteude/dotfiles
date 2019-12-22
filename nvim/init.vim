 " Specify plug in manager
if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " color themes
  Plug 'matsen/nvim-colors-solarized'
  Plug 'lifepillar/vim-solarized8'
  " better visual guide (indentation level lines)
  Plug 'yggdroot/indentline'
  " Git integration
  Plug 'tpope/vim-fugitive'
  " auto-completion
  Plug 'shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
  Plug 'deoplete-plugins/deoplete-jedi'
  " file tree
  Plug 'scrooloose/nerdtree'
  " surround commands
  Plug 'tpope/vim-surround'
  " better syntax highlighting
  Plug 'numirias/semshi'
  " add iron to send code ipython repl
  Plug 'Vigemus/iron.nvim'
  " commenting and uncomenting (cc: comment, cu: uncomment)
  Plug 'scrooloose/nerdcommenter'
  " autoformat (uses yapf installed with pip)
  Plug 'sbdchd/neoformat'
  " code checking
  Plug 'neomake/neomake'
  " code folding
  Plug 'tmhedberg/simpylfold'
  " fuzzy file finder
  Plug 'cloudhead/neovim-fuzzy'
  " markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  " python autoimport
  Plug 'mgedmin/python-imports.vim'
  " tag management (needed by python imports)
  Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" general settings (independent of plugins)
filetype plugin indent on
set number "line numbers
set relativenumber "relative line numbers
set noshowmode
set hidden
set mouse=a
set expandtab
set tabstop=4
set shell=bash " fix the shell to bash
set foldcolumn=0
set notagbsearch " :help does not work without this line
set splitbelow "new windows below
set termguicolors "um truecolors in iterm zu haebn
set clipboard+=unnamedplus "um ins clipboard zu yanken
" modifying iron pluging (sending highlighted code to ipthon)
lua << eof
require("iron").core.set_config {
    repl_open_cmd = 'below 10 split',
    preferred = {
        python = "ipython"
    }
}
eof

"run :Neomake frequently if machine on power supply
function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elsif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif
" set spell spelllang=en,de "spell checking
syntax on
syntax enable

" enable auto complete
let g:deoplete#enable_at_startup = 1
autocmd insertleave,completedone * if pumvisible() == 0 | pclose | endif

" configure code checker
let g:neomake_python_enabled_makers = ['flake8']

"file finder shortcut
nnoremap <C-p> :FuzzyOpen<CR>

"show hidden files in nerdtree
let NERDTreeShowHidden=1

set background=dark " or light
colorscheme solarized8_flat

"highlight pep8 col 79 (only when exceeded)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

