vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function(args)
		vim.opt.textwidth = 85
		vim.opt.autochdir = true
        vim.opt.colorcolumn = "85"
		vim.bo.commentstring = "%|%s|%"
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
