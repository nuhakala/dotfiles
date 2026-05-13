vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.opt.textwidth = 85
		vim.opt.colorcolumn = "85"
		vim.opt.conceallevel = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*/COMMIT_EDITMSG",
	command = "set filetype=markdown tw=72",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function (args)
		-- linux kernel coding style
		local tabs = 8
		vim.bo.tabstop = tabs
		vim.bo.softtabstop = tabs
		vim.bo.shiftwidth = tabs
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function (args)
		vim.opt.textwidth = 85
		vim.opt.colorcolumn = "85"
		local tabs = 2
		vim.bo.tabstop = tabs
		vim.bo.softtabstop = tabs
		vim.bo.shiftwidth = tabs
		vim.bo.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function (args)
		vim.opt.textwidth = 85
		vim.opt.colorcolumn = "85"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "make",
	callback = function (args)
		vim.bo.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function (args)
		-- Idiotic configuration precedence issue: apparently some built-in
		-- config is applied after my own config.
		vim.bo.expandtab = false
	end,
})
