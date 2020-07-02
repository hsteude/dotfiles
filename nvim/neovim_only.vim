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
  Plug 'ayu-theme/ayu-vim'
  Plug 'drewtempelmeyer/palenight.vim'
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
  " auto-completion
  "Plug 'shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }
  "Plug 'deoplete-plugins/deoplete-jedi'
  """"""Autcompletion end

  " file tree
  Plug 'scrooloose/nerdtree'
  " surround commands
  Plug 'tpope/vim-surround'
  " better syntax highlighting
  Plug 'numirias/semshi'
  "Plug 'sheerun/vim-polyglot'
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
  " R programming stuff
  Plug 'jalvesaq/Nvim-R'
  Plug 'gaalcaras/ncm-R'

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
"
"spell checking
set spell spelllang=en
set spellfile=~/dotfiles/nvim/spell/en.utf-8.add
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
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
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

" some color cheme settings
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
set background=dark " or light
let g:one_allow_italics = 1
let g:palenight_terminal_italics=1
"colorscheme solarized8_flat
"let ayucolor="mirage"
colorscheme palenight

function MyCustomHighlights()
    "hi semshiGlobal      ctermfg=red guifg=#ff0000
    hi semshiBuiltin          guifg=#C891E9
    hi semshiAttribute        guifg=#8ADDFF
    hi semshiImported         guifg=#FFCB6A gui=bold
    hi semshiSelected         guifg=#ffffff guibg=#81B1FF
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

" More beautiful indentation line
let g:indentLine_char = '│'

"line breaks with indentation
set breakindent

""""" No tags, use jedi-vim for go to definition
"""" TAGS
" also look for tags in `libtags` in cwd
" set tags=tags;/,libtags;/
" Make ctags from all python libraries
"command! -bar MakeLibTags !ctags -R --languages=Python --exclude='*.pyx' --exclude='*.pxd' -f libtags . `python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
" Make ctags just from local project
"command! -bar MakeTags !ctags -R --languages=Python --exclude='*.pyx' --exclude='*.pxd' -f tags .
" Make both ctags for all python libraries and local project
"command! MakeAllTags silent MakeTags|silent MakeLibTags|redraw!
" On python file save, update local ctags
"autocmd BufWritePost *.py silent MakeTags|exe ':redraw!'

" for pydocstrings
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
let g:pydocstring_templates_dir = '~/.vim/plugged/vim-pydocstring/test/templates/numpy'


""""""""LATEX"""""""

" autocompletion
"call deoplete#custom#var('omni', 'input_patterns', {
      "\ 'tex': g:vimtex#re#deoplete
      "\})
" give me skim as default pdf viewer!!
let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

" Fancy custom function to update pdf after completion found here: https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']

    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif

    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

" Custom command for prettify jsons
command PrettifyJson %!python -m json.tool 
" Custom command to pretify xml
com! PrettifyXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" Don't hide quotes and commands (e.g. in Json files)
set conceallevel=0
set nospell



