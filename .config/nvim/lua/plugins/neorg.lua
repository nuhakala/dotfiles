return {
	{
		"nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
		dependencies = {
            -- { "vhyrro/luarocks.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "numToStr/Comment.nvim" },
			{ "nvim-neorg/neorg-telescope" },
            { "benlubas/neorg-conceal-wrap" },
			-- { "samodostal/image.nvim" }, -- requires nvim 10+
			-- { "pritchett/neorg-capture" },
		},
		config = function()
			require("neorg").setup({
				load = {
                    ["external.conceal-wrap"] = {},
					["core.summary"] = {},
					["core.export"] = {},
					["core.integrations.telescope"] = {
                        config = {
                            insert_file_link = {
                                show_title_preview = false,
                            },
                        }
                    },
					-- ["core.ui.calendar"] = {},
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
								notes = "~/muistiinpanot/zettelkasten/",
								sekalaiset = "~/muistiinpanot/sekalaiset/",
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
                        },
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
