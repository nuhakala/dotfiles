return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
    hint_enable = false,
    floating_window_off_y = -2,
    floating_window_off_x = 15,
  },
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
