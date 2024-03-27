-- ***** Movement *****
-- Move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Improved movement
-- vim.keymap.set({"n", "v"}, "<S-l>", "<C-d>zz")
-- vim.keymap.set({"n", "v"}, "<S-h>", "<C-u>zz")
vim.keymap.set({"n", "v"}, "<C-d>", "<C-d>zz")
vim.keymap.set({"n", "v"}, "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzv")
vim.keymap.set("n", "N", "Nzzv")

-- Moving windows
vim.keymap.set("n", "<leader>m", "<C-W>", { desc = "Initiate window command" })

-- Remap "go to beginning of line"
vim.keymap.set("n", "€", "^", { desc = "Jump to beginning of line"})

-- Remap jumplist actions
vim.keymap.set("n", "<leader><BS>", "<C-o>", { desc = "Jump back"})
vim.keymap.set("n", "<leader><CR>", "<C-i>", { desc = "Jump forward"})

-- Buffer actions
vim.keymap.set("n", "<leader>>", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<leader><", vim.cmd.bprevious, { desc = "Previous buffer" })

-- Tab actions
vim.keymap.set("n", "<leader><tab>", vim.cmd.tabNext, { desc = "Next tab" })


-- ***** Text editing *****
-- Paste on top of text and move that text to void register
vim.keymap.set("x", "<leader>dv", '"_d', { desc = "Delete by pasting into void register" })
-- Improved yanking and pasting
vim.keymap.set({"n", "v"}, "<leader>yy", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>ya", '"ay', { desc = "Yank to a-register" })
vim.keymap.set({"n", "v"}, "<leader>ys", '"sy', { desc = "Yank to s-register" })
-- Pasting
vim.keymap.set({"n", "v"}, "<leader>pp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>pa", '"ap', { desc = "Paste from a-register" })
vim.keymap.set({"n", "v"}, "<leader>ps", '"sp', { desc = "Paste from s-register" })
vim.keymap.set("x", "<leader>pv", '"_dp', { desc = "Paste into void register" })

vim.keymap.set("n", "<leader>,", "<Cmd>:noh<CR>", { desc = "Remove search highlighting" })

-- Replace/edit the word under cursor
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all" })
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = "Select and replace" })

-- Format document
-- vim.keymap.set("n", "<leader>z", function()
-- 	vim.lsp.buf.format()
-- 	print("File formatted")
-- end, { desc = "Format file" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all"})


-- ***** Functionality *****
-- Close buffer without closing window
vim.keymap.set("n", "<leader>dd", function()
	vim.cmd(":bp | sp | bn | bd!")
	print("Buffer deleted")
end, { desc = "Delete buffer" })

-- Exit terminal-mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Save files
-- vim.keymap.set("n", "<leader>w", "<Cmd>:wa<CR>", { desc = "Save all buffers" })

-- Quickfix
vim.keymap.set("n", "<leader>qq", "<Cmd>:ccl<CR>", { desc = "Close quickfix menu" })
vim.keymap.set("n", "<leader>ql", "<Cmd>:lcl<CR>", { desc = "Close locations menu" })
vim.keymap.set("n", "<leader>qo", "<Cmd>:copen<CR>", { desc = "Open quickfix" })

-- Open internet link
vim.keymap.set("n", "<leader>ol", "<Cmd>:execute '!firefox ' . shellescape(expand('<cfile>'), 1)<CR>", { desc = "Open link" })

-- Remap esc on the laptop keyboard
vim.keymap.set("i", "§", "<ESC>")
vim.keymap.set("t", "§", "<C-\\><C-n>")

-- Open split
vim.keymap.set("n", "<C-s>", ":vsplit<CR>", { desc = "Open vertical split" })
