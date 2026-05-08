local set = vim.keymap.set

-- Better moving
set({ "n", "v" }, "<C-d>", "<C-d>zz")
set({ "n", "v" }, "<C-u>", "<C-u>zz")
set("n", "n", "nzz")
set("n", "N", "Nzz")
set("n", "<leader><BS>", "<C-o>", { desc = "Jump back" })
set("n", "<leader><CR>", "<C-i>", { desc = "Jump forward" })
set("n", "<leader><tab>", vim.cmd.tabNext, { desc = "Next tab" })
set("n", "<leader>,", "<Cmd>:noh<CR>", { desc = "Remove search highlighting" })

-- Text editing
set("x", "<leader>dv", '"_d', { desc = "Delete by pasting into void register" })
set({ "n", "v" }, "<leader>yy", '"+y', { desc = "Yank to system clipboard" })
set({ "n", "v" }, "<leader>ya", '"ay', { desc = "Yank to a-register" })
set({ "n", "v" }, "<leader>ys", '"sy', { desc = "Yank to s-register" })
set({ "n", "v" }, "<leader>pp", '"+p', { desc = "Paste from system clipboard" })
set({ "n", "v" }, "<leader>pa", '"ap', { desc = "Paste from a-register" })
set({ "n", "v" }, "<leader>ps", '"sp', { desc = "Paste from s-register" })
set("x", "<leader>pv", [["_dP]], { desc = "Delete to void and paste" })
set("n", "<leader>dv", '"_', { desc = "Delete into void register" })
set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all" })
set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], { desc = "Select and replace" })
set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Spelling
set("n", "<leader>ss", "]s", { desc = "Next spelling mistake" })
set("n", "<leader>sc", ":lua require('telescope.builtin').spell_suggest{}<cr>", { desc = "Correct mistake" })
set("n", "<leader>st", function()
	vim.opt.spell = not vim.o.spell
	vim.opt.spelllang = en
end, { desc = "Toggle spelling" })

-- Close buffer without closing window
set("n", "<leader>dd", function()
	vim.cmd(":bp | sp | bn | bd!")
	print("Buffer deleted")
end, { desc = "Delete buffer" })

-- Exit terminal-mode
set("t", "<Esc>", "<C-\\><C-n>")

-- Remap esc on the laptop keyboard
set("i", "§", "<ESC>")
set("t", "§", "<C-\\><C-n>")
