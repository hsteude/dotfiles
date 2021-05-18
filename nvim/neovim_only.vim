" Specify plug in manager
if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  "Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " color themes
  "Plug 'flazz/vim-colorschemes'
  "Plug 'rakr/vim-one'
  Plug 'kuntau/ayu-vim'
  "Plug 'drewtempelmeyer/palenight.vim'
  " nice icons
  Plug 'ryanoasis/vim-devicons'
  " better visual guide (indentation level lines)
  Plug 'yggdroot/indentline'
  " Git integration
  Plug 'tpope/vim-fugitive'
 
  """""""Autocompletion
  " auto-completion ncm2
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
  " Fast python completion (use ncm2 if you want type info or snippet support)
  Plug 'HansPinckaers/ncm2-jedi'
  " Words in buffer completion
  Plug 'ncm2/ncm2-bufword'
  " Filepath completion
  Plug 'ncm2/ncm2-path'
  " R completion
  Plug 'jalvesaq/Nvim-R'
  Plug 'gaalcaras/ncm-R'

  " For go to definition
  Plug 'davidhalter/jedi-vim'
  """"""Autcompletion end

  " file tree
  Plug 'scrooloose/nerdtree'
  " surround commands
  Plug 'tpope/vim-surround'
  " fancy syntax highlighting
  Plug 'numirias/semshi'
  Plug 'sheerun/vim-polyglot'
  " add iron to send code ipython repl
  "Plug 'Vigemus/iron.nvim'
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
  " vim telescope!!
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " python autoimport
  "Plug 'mgedmin/python-imports.vim'
  " for latex
  Plug 'lervag/vimtex'
  " Python docstrings
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
  " R programming stuff
  Plug 'jalvesaq/Nvim-R'
  Plug 'gaalcaras/ncm-R'
  "Fancy csv viewing and probably more
  Plug 'mechatroner/rainbow_csv'

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

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" greatest remap ever (lets me replace the highlaghted with previously yanked)
vnoremap <leader>p "_dP

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
"
"spell checking
set spell spelllang=en
map <F8>  :setlocal spell spelllang=de <return>
map <F9>  :setlocal spell spelllang=en <return>
syntax on
syntax enable

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
"" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "2"
"let g:deoplete#enable_at_startup = 1
"set completeopt-=preview "no splits for completion options
"
" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
   autocmd Filetype tex call ncm2#register_source({
             \ 'name': 'vimtex',
             \ 'priority': 8,
             \ 'scope': ['tex'],
             \ 'mark': 'tex',
             \ 'word_pattern': '\w+',
             \ 'complete_pattern': g:vimtex#re#ncm2,
             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
             \ })
augroup END

" configure code checker
let g:neomake_python_enabled_makers = ['flake8']

" configure autoformatter
let g:neoformat_enabled_python = ['autopep8']

"file finder shortcut
nnoremap <C-p> :FuzzyOpen<CR>

"show hidden files in nerdtree
let NERDTreeShowHidden=1

colorscheme ayu
let ayucolor="dark"
let ayu_comment_italic=1 " enable italic for comments
let ayu_string_italic=1  " enable italic for strings
let ayu_type_italic=1    " enable italic for types
let ayu_keyword_italic=1 " enable italic for keywords

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

colorscheme ayu

"custom colors for syntax highlightin using semshi..
function MyCustomHighlights()
    "hi semshiGlobal      ctermfg=red guifg=#ff0000
    hi semshiBuiltin          guifg=#C891E9
    hi semshiAttribute        guifg=#8ADDFF
    hi semshiImported         guifg=#FFEE99 gui=bold
    hi semshiSelected         guifg=#ffffff guibg=#5C6773
    hi semshiLocal            guifg=#81B1FF
endfunction
autocmd FileType python call MyCustomHighlights()

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

" More awesome indentation line
let g:indentLine_char = '│'

"line breaks with indentation
set breakindent

" for pydocstrings
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:pydocstring_templates_dir = '~/.vim/plugged/vim-pydocstring/test/templates/numpy'
"let g:pydocstring_formatter = 'numpy'

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = '/usr/bin/zathura'
let g:vimtex_quickfix_ignore_filters = [
  \'Underfull \\hbox (badness [0-9]*) in ',
  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
  \'Overfull \\vbox ([0-9]*.[0-9]*pt too high) detected ',
  \'Package hyperref Warning: Token not allowed in a PDF string',
  \'Package typearea Warning: Bad type area settings!',
  \]

" Custom command for prettify jsons
command PrettifyJson %!python -m json.tool 
" Custom command to pretify xml
com! PrettifyXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" Don't hide quotes and commands (e.g. in Json files)
"set conceallevel=0
set nospell
let g:vimtex_syntax_conceal_default = 0
