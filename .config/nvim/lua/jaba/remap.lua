-- Move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Improved movement
vim.keymap.set("n", "<S-Down>", "<C-d>zz")
vim.keymap.set("n", "<S-Up>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste on top of text and move that text to void register
vim.keymap.set("x", "<leader>P", '"_dP', { desc = "Paste into void register" })

-- Improved yanking and pasting into system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>,", "<Cmd>:noh<CR>", { desc = "Remove search highlighting" })

-- Buffer actions
-- vim.keymap.set("n", "<Tab>", vim.cmd.tabn)
-- vim.keymap.set("n", "<S-Tab>", vim.cmd.tabp)
vim.keymap.set("n", "<S-right>", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<S-left>", vim.cmd.bprevious, { desc = "Previous buffer" })

-- Close buffer without closing window
vim.keymap.set("n", "<leader>o", function()
	vim.cmd(":bp | sp | bn | bd")
	print("Buffer deleted")
end, { desc = "Delete buffer" })

-- Replace/edit the word under cursor
vim.keymap.set("n", "<leader>ra", function()
	local word = vim.fn.expand("<cword>")
	local replacement = vim.fn.input("Replace all '" .. word .. "' with: ")
	vim.cmd(":%s/" .. word .. "/" .. replacement .. "/g")
end, { desc = "Replace all" })
vim.keymap.set("n", "<leader>rs", function()
	local word = vim.fn.expand("<cword>")
	local replacement = vim.fn.input("Choose to replace every '" .. word .. "' with: ")
	vim.cmd(":%s/" .. word .. "/" .. replacement .. "/gc")
end, { desc = "Select and replace" })

-- Exit terminal-mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Save files
vim.keymap.set("n", "<leader>w", "<Cmd>:wa<CR>", { desc = "Save all buffers" })

-- Close quickfix menu
vim.keymap.set("n", "<leader>qq", "<Cmd>:ccl<CR>", { desc = "Close quickfix menu" })
vim.keymap.set("n", "<leader>ql", "<Cmd>:lcl<CR>", { desc = "Close locations menu" })

-- Format document
vim.keymap.set("n", "<leader>z", function()
	vim.lsp.buf.format()
	print("File formatted")
end, { desc = "Format file" })
