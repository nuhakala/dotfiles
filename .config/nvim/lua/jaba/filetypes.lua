vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function(args)
		vim.opt.textwidth = 80
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "md",
  callback = function(args)
		vim.opt.textwidth = 80
  end
})
