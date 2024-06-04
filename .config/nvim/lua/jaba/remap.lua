local set = vim.keymap.set

-- ***** Movement *****
-- Move blocks in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Improved movement
-- set({"n", "v"}, "<S-l>", "<C-d>zz")
-- set({"n", "v"}, "<S-h>", "<C-u>zz")
set({"n", "v"}, "<C-d>", "<C-d>zz")
set({"n", "v"}, "<C-u>", "<C-u>zz")
set("n", "n", "nzz")
set("n", "N", "Nzz")

-- Moving windows
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to below split" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper split" })
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to right split" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to left split" })
set("n", "<M-t>", "<C-w>5<")
set("n", "<M-n>", "<C-w>5>")
set("n", "<M-s>", "<C-w>+")
set("n", "<M-,>", "<C-w>-")

-- Open split
set("n", "<C-s>", ":vsplit<CR>", { desc = "Open vertical split" })
set("n", "<C-m>", ":split<CR>", { desc = "Open vertical split" })

-- Remap jumplist actions
set("n", "<leader><BS>", "<C-o>", { desc = "Jump back"})
set("n", "<leader><CR>", "<C-i>", { desc = "Jump forward"})

-- Buffer actions
set("n", "<leader>>", vim.cmd.bnext, { desc = "Next buffer" })
set("n", "<leader><", vim.cmd.bprevious, { desc = "Previous buffer" })

-- Tab actions
set("n", "<leader><tab>", vim.cmd.tabNext, { desc = "Next tab" })


-- ***** Text editing *****
-- Paste on top of text and move that text to void register
set("x", "<leader>dv", '"_d', { desc = "Delete by pasting into void register" })
-- Improved yanking and pasting
set({"n", "v"}, "<leader>yy", '"+y', { desc = "Yank to system clipboard" })
set({"n", "v"}, "<leader>ya", '"ay', { desc = "Yank to a-register" })
set({"n", "v"}, "<leader>ys", '"sy', { desc = "Yank to s-register" })
-- Pasting
set({"n", "v"}, "<leader>pp", '"+p', { desc = "Paste from system clipboard" })
set({"n", "v"}, "<leader>pa", '"ap', { desc = "Paste from a-register" })
set({"n", "v"}, "<leader>ps", '"sp', { desc = "Paste from s-register" })
-- Deleting
set("n", "<leader>dv", '"_', { desc = "Paste into void register" })

set("n", "<leader>,", "<Cmd>:noh<CR>", { desc = "Remove search highlighting" })

-- Replace/edit the word under cursor
set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all" })
set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = "Select and replace" })

-- Format document
-- set("n", "<leader>z", function()
-- 	vim.lsp.buf.format()
-- 	print("File formatted")
-- end, { desc = "Format file" })

-- Select all
set("n", "<C-a>", "ggVG", { desc = "Select all"})

-- Spelling
set("n", "<leader>ss", "]s", { desc = "Next spelling mistake" })
set("n", "<leader>sc", ":lua require('telescope.builtin').spell_suggest{}<cr>", { desc = "Correct mistake" })
set("n", "<leader>st", function ()
    vim.opt.spell = not vim.o.spell
    vim.opt.spelllang=en
end, { desc = "Toggle spelling" })

-- ***** Functionality *****
-- Close buffer without closing window
set("n", "<leader>dd", function()
	vim.cmd(":bp | sp | bn | bd!")
	print("Buffer deleted")
end, { desc = "Delete buffer" })

-- Exit terminal-mode
set("t", "<Esc>", "<C-\\><C-n>")

-- Save file
set("n", "<leader>w", "<Cmd>:w<CR>", { desc = "Save buffer" })

-- Quickfix
set("n", "<leader>qq", "<Cmd>:ccl<CR>", { desc = "Close quickfix menu" })
set("n", "<leader>ql", "<Cmd>:lcl<CR>", { desc = "Close locations menu" })
set("n", "<leader>qo", "<Cmd>:copen<CR>", { desc = "Open quickfix" })

-- Open internet link
set("n", "<leader>ol", "<Cmd>:execute '!firefox ' . shellescape(expand('<cfile>'), 1)<CR>", { desc = "Open link" })

-- Remap esc on the laptop keyboard
set("i", "§", "<ESC>")
set("t", "§", "<C-\\><C-n>")
