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
				{
					name = "todo",
					path = "~/muistiinpanot/gtd",
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
			note = {
				template = "note-template.md",
			},
			checkbox = {
				enabled = true,
				create_new = true,
				order = { " ", "x", ">", "~", "!" },
			},
		},
		keys = {
			{
				"<localleader>ou",
				function()
					local note = require("obsidian.api").current_note(0)
					if note and note.metadata and note.metadata.updated then
						--
						local date = os.date("%Y-%m-%dT%H:%M:%S%z")
						note.metadata.updated = date
						note:update_frontmatter(note.bufnr)
						-- Save changes
						-- vim.api.nvim_buf_call(note.bufnr, function() vim.cmd("write") end)
					else
						vim.print("Current buffer does not contain obsidian note.")
					end
				end,
				desc = "Update obsidian note timestamp",
			},
			{
				"<localleader>on",
				function()
					vim.ui.input({ prompt = "Enter note name: " }, function(user_input)
						-- Cancelled input
						if not user_input or user_input == "" then
							return
						end

						local template = "note-template.md"
						require("obsidian.actions").new_from_template(user_input, template, function(note)
							note:open({ sync = true })
						end)

						-- Set cursor to after metadata
						vim.api.nvim_win_set_cursor(0, { 17, 0 })
					end)
				end,
				desc = "Create new note from template",
			},
			{
				"<localleader>os",
				":Telescope live_grep<cr>title: ",
				desc = "Search for files"
			},
		},
	},
}
