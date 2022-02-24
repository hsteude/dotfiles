local fn = vim.fn
local cmd = vim.cmd
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

------------
local api = vim.api
local cmd = api.nvim_command
local g = vim.g

local U = {}

-- Key mapping function
function U.map(mode, key, result, opts)
    opts =
        vim.tbl_extend(
        "keep",
        opts or {},
        {
            noremap = true,
            silent = true,
            expr = false
        }
    )

    api.nvim_set_keymap(mode, key, result, opts)
end

-------------
-- Options --
-------------
local global_opts = {
    encoding      = 'utf-8',
    termguicolors = true,
    mouse         = 'a',
    smarttab      = true,
    ignorecase    = true,
    smartcase     = true,
    splitbelow    = true,
    splitright    = true,
    showmode      = true,
    history       = 5000,
    autowrite     = true,
    undofile      = true,
    updatetime    = 300,
    ttimeoutlen   = 10,
    timeoutlen    = 500,
    title         = true,
    wildmenu      = true,
    wildmode      = 'full',
    hidden        = true,
    hlsearch      = true,
    incsearch     = true,
    backspace     = 'indent,eol,start',
    completeopt   = 'menuone,noselect',
    formatoptions = 'j,r,o,q'  -- see `help fo-table` for meaning
}

local win_opts = {
    cursorline = true,
    number     = true,
    relativenumber= true,
    foldmethod = 'expr',
    foldexpr   = 'nvim_treesitter#foldexpr()',
    foldenable = true,
    foldlevel   = 10,
}

local buf_opts = {
    autoindent  = true,
    smartindent = true,
    infercase   = true,
    expandtab   = true,
    shiftwidth  = 4,
    softtabstop = 4,
    tabstop     = 4,
    textwidth   = 80,
}

for k, v in pairs(global_opts) do
	vim.o[k] = v
end

for k, v in pairs(buf_opts) do
	vim.o[k] = v
    relativenumber = true
	vim.bo[k] = v
end

for k, v in pairs(win_opts) do
	vim.o[k] = v
	vim.wo[k] = v
end

-------------
-- Plugins --
-------------






--------------------------
-- Vimtexview method
--------------------------
g.vimtex_view_method = 'skim'


g.languagetool_server_jar = '/usr/local/bin/LanguageTool-5.4-stable/languagetool-server.jar'

--------------------------
-- VIMWIKI
--------------------------
vim.g.vimwiki_list = {
    {
        path = '/Users/henrik/Google Drive/WIKI',
        syntax = 'markdown',
        ext = '.md',
    }
}

---------
-- Colors
---------
local theme = 'ayu'
--local theme = 'PaperColor'
--local airline_theme = 'papercolor'
local airline_theme = 'minimalist'
vim.api.nvim_command('colorscheme ' .. theme)

------------
-- Telescope
------------
local finders = require "telescope.builtin"
local actions = require "telescope.actions"
local sorters = require "telescope.sorters"

require("telescope").setup(
    {
        defaults = {
            --prompt_position = "top",
            prompt_prefix = " ❯ ",
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    ["<ESC>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-o>"] = function()
                        return
                    end,
                    ["<TAB>"] = function()
                        return
                    end
                }
            },
            file_sorter = sorters.get_fzy_sorter,
            generic_sorter = sorters.get_fzy_sorter
        }
    }
)


function TelescopeOpen(fn)
    finders[fn]()
end



--------------------------
-- Zen Mode 
--------------------------
require("zen-mode").setup(
{
    window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
       signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = true }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end}
)
--------------------------
-- neomake for autopep8 
--------------------------
g.neoformat_enabled_python = {'autopep8'}

--------------------------
-- NERDTree
--------------------------
g.NERDTreeShowHidden = 1

--------------------------
-- Vim Move
--------------------------
--g.move_map_keys = 0
--g.move_key_modifier = "C"

------------------------
-- airline (status bar)
g.airline_powerline_fonts = 1
g["airline#extensions#tabline#enabled"] = 1
g["airline#extensions#tabline#fnamemod"] = ':t'
g.airline_theme = airline_theme

------------------------
-- behaviour of the peekup window on keystroke
------------------------
require('nvim-peekup.config').on_keystroke["delay"] = '100ms'
require('nvim-peekup.config').on_keystroke["autoclose"] = true
require('nvim-peekup.config').on_keystroke["paste_reg"] = '"'

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)



------------
-- lspconfig
------------
--local nvim_lsp = require('lspconfig')
--local on_attach = function(client, bufnr)
  --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  ---- Mappings.
  --local opts = { noremap=true, silent=true }
  --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  ---- Set some keybinds conditional on server capabilities
  --if client.resolved_capabilities.document_formatting then
    --buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  --end
  --if client.resolved_capabilities.document_range_formatting then
    --buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  --end

  ---- Set autocommands conditional on server_capabilities
  --if client.resolved_capabilities.document_highlight then
    --vim.api.nvim_exec([[
      --hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      --hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      --hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      --augroup lsp_document_highlight
        --autocmd! * <buffer>
        --autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --augroup END
    --]], false)
  --end
--end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)


-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
sources = {
  { name = 'nvim_lsp' },
  { name = 'path' },
  { name = 'vsnip' },
  { name = 'buffer' },
}
})

----------
-- Mappings
-----------
-- don't use ex mode, use Q for formatting (wrapping text in new lines)
U.map('n', 'Q', 'gq}')
-- mapping to write file that needs sudo privileges
U.map('n', 'w!!', '%!sudo tee > /dev/null %')
-- make Y work as C or D,
--U.map('n', 'Y', 'y$')
--Uap('v', 'Y', ':"<,">,let @+ = @"<CR>')
-- make ctrl-l remove highlights and re-apply syntax highlighting
U.map('n', '<C-l>', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>')
-- switch to next/previous buffer with Tab/shift+Tab
U.map('n', 'L', ':bnext<CR>')
U.map('n', 'H', ':bprevious<CR>')
-- shortcut to replace highlighted section with paste register content
U.map("v", "<leader>p", "_dP")
-- nerdtree shortcut
U.map("n", "<leader>e", ":NERDTree<CR>")
-- insert breakpoint in python
U.map("n", "<leader>b", "obreakpoint()<ESC>")
-- toggle zen mode with leader z
U.map("n", "<leader>z", ":ZenMode<CR>")

-- Ctrl-p = fuzzy finder and stuff
U.map("n", "<C-P>", "<CMD>lua require('telescope.builtin').find_files()<CR>")
U.map("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
U.map("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
U.map("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
U.map("n", "<leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")

-- LSP Mappings
U.map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
U.map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
U.map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
U.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
U.map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
U.map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR')

--U.map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
--U.map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
--U.map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
U.map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
U.map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
U.map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
U.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
U.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
U.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
U.map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
