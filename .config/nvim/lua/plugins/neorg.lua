return {
	{
		"vhyrro/luarocks.nvim",
        priority = 1000,
		config = true,
        -- event = "VeryLazy",
	},
	{
		"nvim-neorg/neorg",
        -- event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "numToStr/Comment.nvim" },
			{ "nvim-neorg/neorg-telescope" },
			-- { "samodostal/image.nvim" }, -- requires nvim 10+
			-- {
			-- 	"pysan3/neorg-templates",
			-- 	dependencies = { "L3MON4D3/LuaSnip" },
			-- },
			-- { "pritchett/neorg-capture" },
		},
		config = function()
			require("neorg").setup({
				load = {
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.integrations.telescope"] = {},
					["core.export"] = {},

					["core.defaults"] = {
						config = {
							disable = {
								-- "core.itero",
								"core.journal",
							},
						},
					}, -- Loads default behaviour

                    ["core.esupports.metagen"] = {
                        config = {
                            author = "Jäbä",
                            undojoin_updates = true,
                        },
                    },

					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/muistiinpanot/",
							},
						},
					},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
							hook = function(keybinds)
								-- <M-CR> launches terminal in WM
								-- In insert mode, this creates new list item
								keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
								-- In normal mode, opens a link to vertical split
								keybinds.remap_key("norg", "n", "<M-CR>", "<S-CR>")
								keybinds.map("norg", "n", keybinds.leader .. "mi", "<CMD>Neorg index<CR>")
								keybinds.map( "norg", "n", keybinds.leader .. "g", "<CMD>Neorg generate-workspace-summary<CR>", { desc = "Generate summary" })

								-- Telescope
								keybinds.remap_event( "norg", "n", keybinds.leader .. "fl", "core.integrations.telescope.find_linkable", { desc = "Neorg find linkable" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "ff", "core.integrations.telescope.find_norg_files", { desc = "Neorg find file" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "il", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "if", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "i", "<C-,>", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "i", "<C-f>", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })

								keybinds.unmap("norg", "n", keybinds.leader .. "nn")
								vim.keymap.set("n", "<localleader>nn", function()
									local dirman = require("neorg").modules.get_module("core.dirman")

									vim.ui.input({ prompt = "Enter note name: " }, function(user_input)
										-- Cancelled input
										if not user_input or user_input == "" then
											return
										end

										local title = ""
										for str in string.gmatch(user_input, "([^_]+)") do
											title = title .. str .. " "
										end
										title = string.sub(title, 1, -2) -- remove whitespace
										local date = os.date("%Y-%m-%d--")

										-- Get subfolder
										local file_path = vim.api.nvim_buf_get_name(0)
										local path = vim.fs.dirname(file_path)
										local ws = dirman.get_current_workspace()[2]
										if path ~= ws then
											path = string.sub(path, string.len(ws), -1)
										else
											path = ""
										end

										dirman.create_file(path .. "/" .. date .. user_input, nil, {
											no_open = false, -- open file after creation?
											force = false, -- overwrite file if exists
											metadata = {
												title = require("neorg.core").lib.title(title),
											},
										})

										-- Set cursor to after metadata
										vim.api.nvim_buf_set_lines(0, 10, 10, false, { "" })
										vim.api.nvim_win_set_cursor(0, { 11, 0 })
									end)
								end, { desc = "Create New Note" })

                                -- Undojoin
                                keybinds.map("norg", "n", "u", function()
                                    require("neorg.modules.core.esupports.metagen.module").public.skip_next_update()
                                    local k = vim.api.nvim_replace_termcodes("u<c-o>", true, false, true)
                                    vim.api.nvim_feedkeys(k, 'n', false)
                                end)
                                keybinds.map("norg", "n", "<c-r>", function()
                                    require("neorg.modules.core.esupports.metagen.module").public.skip_next_update()
                                    local k = vim.api.nvim_replace_termcodes("<c-r><c-o>", true, false, true)
                                    vim.api.nvim_feedkeys(k, 'n', false)
                                end)
							end,
						},
					},
					["core.summary"] = {
						-- config = {
						-- 	strategy = "current_dir",
						-- },
					},

					-- requires nvim 10+
					-- ["core.integrations.image"] = {},
					-- ["core.latex.renderer"] = {},

					-- ["external.templates"] = {},
					-- ["external.capture"] = {},
				},
			})

			-- Set filetype comment
			local ft = require("Comment.ft")
			ft.norg = { "%|%s|%", "%|%s|%" }
		end,
	},
}
