return {
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
					name = "vault",
					path = "~/muistiinpanot/zettelkasten-md/",
				},
			},
			note_path_func = function(spec)
				local date = os.date("%Y-%m-%d--%H-%M")
				local name = date .. ".md"
				return name
			end,
			templates = {
				folder = "assets/obs-templates/",
				date_format = "%Y-%m-%dT%H:%M:%S%z",
				time_format = "%H:%M",
			},
		},
	},
}
