local statusline = {
	" %f", -- filepath
	" %h%m%r%q%w", -- help, modified, readonly, quickfix, preview flags

	"%=", -- separator

	"%y", -- filetype
	" [%{&fenc==''?&enc:&fenc}]", -- file encoding
	-- " %B", -- value of the character under curser, hexadecimal
	" %3l:%-2v", -- line number: column
	-- " %v",
	" %2p%%/%-3L",
}
vim.o.statusline = table.concat(statusline, '')
