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
            { "vhyrro/luarocks.nvim" },
			-- { "nvim-lua/plenary.nvim" },
			{ "numToStr/Comment.nvim" },
			{ "nvim-neorg/neorg-telescope" },
            { "benlubas/neorg-conceal-wrap" },
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
                    -- Wait for neovim 0.10.0
                    ["external.conceal-wrap"] = {},
					["core.integrations.telescope"] = {},
					["core.export"] = {},
					["core.concealer"] = {
                        config = {
                            icon_preset = "diamond",
                            icons = {
                                -- Enable concealing of @code and @end
                                code_block = {
                                    conceal = true
                                },
                                todo = {
                                    on_hold = {
                                        icon = ""
                                    }
                                }
                            }
                        }
                    },
                    ["core.highlights"] = {
                        config = {
                            highlights = {
                                todo_items = {
                                    -- Remove annoying background highlight
                                    on_hold = "+@module"
                                }
                            }
                        }
                    },

					["core.defaults"] = {
						config = {
							disable = {
								"core.journal",
                                "core.clipboard.code-blocks"
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
								-- keybinds.map("norg", "n", keybinds.leader .. "gg", "<CMD>Neorg generate-workspace-summary<CR>", { desc = "Generate summary" })
								keybinds.map("norg", "n", keybinds.leader .. "c", "<CMD>Neorg toc<CR>", { desc = "Table of contents" })

								-- Telescope
								keybinds.remap_event( "norg", "n", keybinds.leader .. "fl", "core.integrations.telescope.find_linkable", { desc = "Neorg find linkable" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "ff", "core.integrations.telescope.find_norg_files", { desc = "Neorg find file" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "il", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "n", keybinds.leader .. "if", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "i", "<C-,>", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
								keybinds.remap_event( "norg", "i", "<C-f>", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })

								keybinds.unmap("norg", "n", keybinds.leader .. "nn")
								keybinds.map("norg", "n", "<localleader>nn", function()
									local dirman = require("neorg").modules.get_module("core.dirman")

									vim.ui.input({ prompt = "Enter note name: " }, function(user_input)
										-- Cancelled input
										if not user_input or user_input == "" then
											return
										end

                                        local file_name = user_input:gsub(" ", "_")
										local date = os.date("%Y-%m-%d--")
										local ws = dirman.get_current_workspace()[1]

										dirman.create_file(date .. file_name, ws, {
											no_open = false, -- open file after creation?
											force = false, -- overwrite file if exists
											metadata = {
												title = require("neorg.core").lib.title(user_input),
                                                -- title = user_input,
											},
										})

										-- Set cursor to after metadata
                                        vim.api.nvim_buf_set_lines(0, 10, 14, false, { "*Lähteet*:", "- %|TODO: lähde|%", "", ""})
										vim.api.nvim_win_set_cursor(0, { 14, 0 })
									end)
								end, { desc = "Create New Note" })

                                -- Create workspace summary using above line
                                keybinds.map("norg", "n", "<localleader>g", function ()
                                    local current_line = vim.api.nvim_win_get_cursor(0)[1]
                                    local line = vim.api.nvim_buf_get_lines(0, current_line - 2, current_line - 1, false)[1]
                                    local cmd = string.sub(line, 2, -2)
                                    vim.cmd(cmd)
                                end)

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
