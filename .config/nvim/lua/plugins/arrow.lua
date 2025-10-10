return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = {
		show_icons = true,
		leader_key = "<leader>h", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
		save_key = "git_root",
	},
}
