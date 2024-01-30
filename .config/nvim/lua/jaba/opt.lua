-- EDITING
vim.opt.nu = true
vim.opt.relativenumber = true

local tabs = 4
vim.opt.tabstop = tabs
vim.opt.softtabstop = tabs
vim.opt.shiftwidth = tabs
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.conceallevel = 1

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = "+++ "

-- When typing a search command, show where the pattern matches
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- When in blockmode, enable virtualedit
-- virtualedit = treat each cell as character
vim.opt.virtualedit = "block"
-- When searching, show the matches on bottom
vim.opt.inccommand = "split"

-- FUNCTIONALITY
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.dir = os.getenv("HOME") .. "/.vim/swap/"

-- Required for many plugins! Enables some color support related to terminal.
vim.opt.termguicolors = true

-- Be default horizontalspilt to below and vertical to right
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Set folding to work with treesitter
-- Need to be set after treesitter is loaded.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 999

-- Required for ts-contex-comment-string, without it, shows a warning when opening.
vim.g.skip_ts_context_commentstring_module = true
