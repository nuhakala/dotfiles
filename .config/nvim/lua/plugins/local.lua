return {
	{
		dir = "~/OmatProjektit/nvim-typst-preview/",
		dev = true,
		config = function()
			require("nvim-typst-preview").setup({
				dir = "~/muistiinpanot/",
				file_name = "preview.typ",
			})
            vim.keymap.set("n", "<leader>op", require("nvim-typst-preview").toggle, { desc = "Toggle preview" })
		end,
	}
}
