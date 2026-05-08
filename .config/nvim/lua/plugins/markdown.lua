return {
	-- 	{
	-- 		"MeanderingProgrammer/render-markdown.nvim",
	-- 		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	-- 		---@module 'render-markdown'
	-- 		---@type render.md.UserConfig
	-- 		opts = {
	-- 			heading = {
	-- 				width = 'block',
	-- 				left_pad = 2,
	-- 				right_pad = 4,
	-- 			},
	-- 			code = {
	-- 				width = "block",
	-- 				sign = false,
	-- 				border = "thick",
	-- 				min_width = 45,
	-- 				language_border = ' ',
	-- 				language_left = '',
	-- 				language_right = '',
	-- 			}
	-- 		},
	-- 	},

	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "personal",
					path = "~/muistiinpanot/testi2",
				},
			},
		},

		config = function(_, opts)
			require("obsidian").setup(opts)

			-- Autocommand to auto-update updated field
			vim.api.nvim_create_autocmd("User", {
				pattern = "ObsidianNoteWritePost",
				callback = function(ev)
					local note = require("obsidian.note").from_buffer(ev.buf)
					if note then
						local date = os.date("%Y-%m-%dT%H:%M:%S%z")
						vim.print(date)
						note:add_field("updated", date)
						note:save_to_buffer()
					end
				end,
			})
		end,
	},
}
