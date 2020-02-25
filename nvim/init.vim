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
  Plug 'lifepillar/vim-solarized8'
  Plug 'rakr/vim-one'
  Plug 'arcticicestudio/nord-vim'
  " nice icons
  Plug 'ryanoasis/vim-devicons'
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
  Plug 'sheerun/vim-polyglot'
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
  "Plug 'ludovicchabant/vim-gutentags'
  " for latex
  Plug 'lervag/vimtex'
  " Python docstrings
  Plug 'heavenshell/vim-pydocstring'

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
set completeopt-=preview "no splits for completion options

" configure code checker
let g:neomake_python_enabled_makers = ['flake8']

" configure autoformatter
let g:neoformat_enabled_python = ['autopep8']

"file finder shortcut
nnoremap <C-p> :FuzzyOpen<CR>

"show hidden files in nerdtree
let NERDTreeShowHidden=1

" some color cheme settings
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
set background=dark " or light
let g:one_allow_italics = 1
"colorscheme solarized8_flat
colorscheme one

"highlight pep8 col 79 (only when exceeded)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"start with folds open
set foldlevel=10

"Gdiff vertical split
set diffopt+=vertical

"Dont hide anhthing (in mardown files)
autocmd FileType markdown let g:indentLine_enabled=0

"search not case sensitive
:set ic
"search case sensitive
":set noic

" Clear last search highlighting
map <Space> :noh<cr>

" Autoreload files after a while
set autoread
au FocusGained * :checktime

" More beautiful indentation line
let g:indentLine_char = '│'

"line breaks with indentation
set breakindent

" no ~ at stark of line
set fcs=eob:\ 

"""" TAGS
" also look for tags in `libtags` in cwd
set tags=tags;/,libtags;/
" Make ctags from all python libraries
command! -bar MakeLibTags !ctags -R --languages=Python --exclude='*.pyx' --exclude='*.pxd' -f libtags . `python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
" Make ctags just from local project
command! -bar MakeTags !ctags -R --languages=Python --exclude='*.pyx' --exclude='*.pxd' -f tags .
" Make both ctags for all python libraries and local project
command! MakeAllTags silent MakeTags|silent MakeLibTags|redraw!
" On python file save, update local ctags
autocmd BufWritePost *.py silent MakeTags|exe ':redraw!'

" for pydocstrings
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:pydocstring_templates_dir = '~/.vim/plugged/vim-pydocstring/test/templates/numpy'