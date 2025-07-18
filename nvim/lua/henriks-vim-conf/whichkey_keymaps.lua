local wk = require("which-key")

wk.add({
  -- Direct mappings
  { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim Tree" },
  { "<C-P>", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>", desc = "Open file finder" },
  { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  { "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
  { "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostic" },
  { "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Go to next diagnostic" },
  { "<leader>b", "obreakpoint()<ESC>", desc = "Insert Python breakpoint" },
  { "<leader>m", "<cmd>!make<CR>", desc = "Execute make file in this directory" },
  { "<C-l>", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>", desc = "Clear highlights and refresh" },

  -- Files group
  { "<leader>f", group = "Files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Search Help Tags" },
  { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },

  -- LSP group
  { "<leader>l", group = "LSP" },
  { "<leader>ld", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  { "<leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
  { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
  { "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Help" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format buffer" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
  { "<leader>lo", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
  { "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Go to previous" },
  { "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Go to next" },
  { "<leader>ll", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", desc = "Set loclist" },
  { "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show diagnostics in a floating window" },
  { "<leader>lt", "<cmd>ToggleDiag<CR>", desc = "Toggle Diagnostics" },

  -- Comments group
  { "<leader>c", group = "Comments" },

  -- Git group
  { "<leader>g", group = "Git" },
  { "<leader>gi", "<cmd>Neogit<CR>", desc = "Interactive staging and others" },
  { "<leader>go", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
  { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
  { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Open file history tool" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Show Blame info for line" },

  -- TTYD-Copy-Mode group
  { "<leader>h", group = "TTYD-Copy-Mode" },
  { "<leader>ha", "<cmd>set nonumber norelativenumber mouse-=a scl=no<CR>", desc = "Turn off line numbers and mouse support" },
  { "<leader>hs", "<cmd>set number relativenumber mouse+=a scl=yes<CR>", desc = "And turn all back on" },

  -- Spellcheck group
  { "<leader>s", group = "Spelllang" },
  { "<leader>sd", "<cmd>setlocal spell spelllang=de<CR>", desc = "Set spellcheck to German" },
  { "<leader>se", "<cmd>setlocal spell spelllang=en<CR>", desc = "Set spellcheck to English" },
  { "<leader>so", "<cmd>setlocal nospell<CR>", desc = "Turn off spellcheck" },

  -- Clipboard group
  { "<leader>y", group = "Clipboard" },
  { "<leader>yy", '"+y', desc = "Copy line to system clipboard" },
  { "<leader>yw", '"+yw', desc = "Copy word to system clipboard" },
  { "<leader>yiw", '"+yiw', desc = "Copy inner word to system clipboard" },
  { "<leader>y$", '"+y$', desc = "Copy to end of line to system clipboard" },

  -- Visual mode mappings
  { "<leader>y", '"+y', desc = "Copy selection to system clipboard", mode = "v" },
})
