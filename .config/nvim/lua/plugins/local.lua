return {
	{
		dir = "~/OmatProjektit/neorg-typst-preview/",
		dev = true,
		config = function()
			require("neorg-typst-preview").setup({
				dir = "~/muistiinpanot/preview/",
				file_name = "preview.typ",
			})
			vim.keymap.set("n", "<leader>op", require("neorg-typst-preview").toggle, { desc = "Toggle preview" })
		end,
	},
}
