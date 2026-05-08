local opt = vim.opt
-- Stuff
opt.nu = true
opt.relativenumber = true
opt.wrap = false
opt.scrolloff = 8
-- vim.opt.showbreak = "+++ "
-- vim.opt.listchars = "tab:▎-,lead:.,multispace:▎..." -- space:·,
-- vim.opt.list = true

-- Indentation
local tabs = 4
opt.tabstop = tabs
opt.softtabstop = tabs
opt.shiftwidth = tabs
opt.expandtab = false
opt.smartindent = true

-- Search settings
opt.incsearch = true -- Show matches as you type
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search

-- Visual settings
opt.termguicolors = true
opt.conceallevel = 0
opt.virtualedit = "block"
opt.inccommand = "split"
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.cursorline = true
opt.synmaxcol = 300 -- Syntax highlighting limit, improves minified files

-- File handling
opt.swapfile = true
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.dir = os.getenv("HOME") .. "/.vim/swap/"
opt.autoread = true -- Auto reload files changed outside vim

-- Behavior settings
opt.mouse = "nv"

-- Split settings
opt.splitbelow = true
opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = "+"

-- Folding
opt.foldmethod = "indent"
opt.foldlevelstart = 999
opt.smoothscroll = true
