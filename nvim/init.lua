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
    formatoptions = 'j,r,o,q',  -- see `help fo-table` for meaning
}

local win_opts = {
    cursorline = true,
    number     = true,
    relativenumber= true,
    foldmethod = 'expr',
    foldexpr   = 'nvim_treesitter#foldexpr()',
    foldenable = true,
    foldlevel   = 10,
    colorcolumn = '80',
}

local buf_opts = {
    autoindent  = true,
    smartindent = true,
    infercase   = true,
    expandtab   = true,
    shiftwidth  = 4,
    softtabstop = 4,
    tabstop     = 4,
    textwidth   = 79,
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



--------------------------
-- Vimtexview method
--------------------------
g.vimtex_view_method = 'skim'


---------
-- Colors
---------
--local theme = 'ayu'
--local theme = 'PaperColor'
--local theme = 'gruvebox'
--local airline_theme = 'papercolor'
--local airline_theme = 'gruvbox'
--vim.api.nvim_command('colorscheme ' .. theme)
--colorscheme = 'gruvbox'

vim.highlight.create('Comment', {cterm='italic', gui='italic'}, false)

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {
              SignColumn = {bg = ""}
  },
})
vim.cmd("colorscheme gruvbox")


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


require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,

        -- Next, you can provide targeted overrides for specific servers.
        -- For example, a handler override for the rust_analyzer:
        --["rust_analyzer"] = function ()
            --require("rust-tools").setup {}
        --end
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local lspconfig = require('lspconfig')
lspconfig.ltex.setup {
    settings = {
        ltex = {
            language = 'de'
        }
    }
}

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
--g.neoformat_enabled_python = {'autopep8'}

--------------------------
-- NERDTree
--------------------------
g.NERDTreeShowHidden = 1

------------------------
-- airline (status bar)
g.airline_powerline_fonts = 1
g["airline#extensions#tabline#enabled"] = 1
g["airline#extensions#tabline#fnamemod"] = ':t'
g.airline_theme = 'minimalist'

g["grammarous#use_vim_spelllang"] = 1

------------------------
-- behaviour of the peekup window on keystroke
------------------------
require('nvim-peekup.config').on_keystroke["delay"] = '100ms'
require('nvim-peekup.config').on_keystroke["autoclose"] = true
require('nvim-peekup.config').on_keystroke["paste_reg"] = '"'




-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    mapping = cmp.mapping.preset.insert({
      --['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Select }),
      --['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Select }),  
      --['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Insert }), 
      --['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Insert }), 
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      --{ name = 'vsnip' },
      --{ name = 'buffer' },
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
U.map("n", "<leader>e", ":NERDTreeToggle<CR>")
-- insert breakpoint in python
U.map("n", "<leader>b", "obreakpoint()<ESC>")
-- toggle zen mode with leader z
U.map("n", "<leader>z", ":ZenMode<CR>")

-- Ctrl-p = fuzzy finder and stuff
U.map("n", "<C-P>", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>")
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
U.map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

--U.map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
---U.map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
--U.map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
U.map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
U.map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
U.map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
U.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
U.map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
U.map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
U.map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
U.map('n', '<leader>mp', '<cmd>!open -a "firefox" "%" <CR>')
-- The following command requires plug-ins "nvim-telescope/telescope.nvim",
-- "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>',
    { noremap = true, silent = true })
