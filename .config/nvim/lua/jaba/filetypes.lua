vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function(args)
		vim.opt.textwidth = 80
		vim.opt.autochdir = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.opt.textwidth = 80
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*/COMMIT_EDITMSG",
	command = "set filetype=markdown tw=72",
})
