return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = "^$",
			mappings = {
				basic = true,
				extra = true,
			},
			post_hook = nil,
		})
	end,
}
