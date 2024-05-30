return {
	"freddiehaddad/feline.nvim",
	dependencies = "stevearc/aerial.nvim",
	config = function()
		local one_monokai = {
			fg = "#abb2bf",
			bg = "#1e2024",
			green = "#98c379",
			yellow = "#e5c07b",
			purple = "#c678dd",
			orange = "#d19a66",
			peanut = "#f6d5a4",
			red = "#e06c75",
			aqua = "#61afef",
			darkblue = "#282c34",
			dark_red = "#f75f5f",
		}

		local vi_mode_colors = {
			NORMAL = "green",
			OP = "green",
			INSERT = "yellow",
			VISUAL = "purple",
			LINES = "orange",
			BLOCK = "dark_red",
			REPLACE = "red",
			COMMAND = "aqua",
		}

		local custom_providers = {
			formatter = function()
				local res = ""
				-- get formatters from conform
				local formatters = require("conform").list_formatters()
            for _, v in pairs(formatters) do
					res = res .. v.name .. ", "
				end
				-- strip the last ", "
				return res:sub(1, -3)
			end,

            function_scope = function(_, opts)
                local symbols = require("aerial").get_location(true)
                local depth = opts.depth or #symbols
                local sep = opts.sep or " ⟩ "

                depth = depth < #symbols and depth or #symbols
                local res = ""
                for idx = #symbols - depth + 1, #symbols do
                    res = res .. symbols[idx].icon .. symbols[idx].name .. sep
                end
                if string.len(res) > 0 then
                    res = res:sub(1, -6)
                end
                return res
            end,

            my_git_branch = function(_, opts)
                -- NOTE: This script must be in path  
                local handle = io.popen("git_branch.sh")
                local result = handle and handle:read("*a"):sub(1, -2) or ""
                if result ~= "" then
                    result = " " .. result
                end
                if handle then handle:close() end
                return result
            end,

            my_git_diff_added = function(_, opts)
                local t = vim.b.minidiff_summary
                return t and t.add or ""
            end,

            my_git_diff_changed = function(_, opts)
                local t = vim.b.minidiff_summary
                return t and t.change or ""
            end,

            my_git_diff_removed = function(_, opts)
                local t = vim.b.minidiff_summary
                return t and t.delete or ""
            end,
		}

		local c = {
			vim_mode = {
				provider = {
					name = "vi_mode",
					-- opts = {
					-- 	show_mode_name = true,
					-- },
				},
				hl = function()
					return {
						fg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
					}
				end,
				left_sep = "block",
				right_sep = "block",
			},

			fileinfo = {
				provider = {
					name = "file_info",
					opts = {
						type = "relative",
					},
				},
				short_provider = {
					name = "file_info",
					opts = {
						type = "relative-short",
					},
				},
                hl = {
                    fg = "orange"
                },
				left_sep = "block",
				right_sep = "block",
			},

			lsp_client_names = {
				provider = "lsp_client_names",
				hl = {
					fg = "purple",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},

			formatters = {
				provider = {
                    name = "formatter",
                },
				hl = {
					fg = "purple",
					style = "bold",
				},
				right_sep = "block",
			},

            function_scope = {
                provider = {
                    name = "function_scope",
                    opts = {
                        depth = 3,
                    },
                },
                short_provider = {
                    name = "function_scope",
                    opts = {
                        depth = 1
                    },
                },
                update = { "ModeChanged", "CursorMoved" },
                hl = {
                    fg = "yellow",
                    style = "bold",
                },
                left_sep = "block",
            },

			file_encoding = {
				provider = "file_encoding",
				hl = {
					fg = "orange",
					style = "italic",
				},
				left_sep = "block",
				right_sep = "block",
			},

			position = {
				provider = "position",
				hl = {
					fg = "green",
				},
				left_sep = "block",
				right_sep = "block",
			},

			-- Git
			gitBranch = {
				provider = "my_git_branch",
				hl = {
					fg = "peanut",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			gitDiffAdded = {
				provider = "my_git_diff_added",
				hl = {
					fg = "green",
				},
				icon = {
					str = "+",
					hl = { fg = "green" },
				},
				right_sep = "block",
			},
			gitDiffRemoved = {
				provider = "my_git_diff_removed",
				hl = {
					fg = "red",
				},
				icon = {
					str = "-",
					hl = { fg = "red" },
				},
				right_sep = "block",
			},
			gitDiffChanged = {
				provider = "my_git_diff_changed",
				hl = {
					fg = "aqua",
				},
				icon = {
					str = "~",
					hl = { fg = "aqua" },
				},
				right_sep = "block",
			},

			separator = {
				provider = " ",
			},

			-- Diagnostics
			diagnostic_errors = {
				provider = "diagnostic_errors",
				hl = {
					fg = "red",
				},
			},
			diagnostic_warnings = {
				provider = "diagnostic_warnings",
				hl = {
					fg = "yellow",
				},
			},
			diagnostic_hints = {
				provider = "diagnostic_hints",
				hl = {
					fg = "aqua",
				},
			},
			diagnostic_info = {
				provider = "diagnostic_info",
			},
			line_percentage = {
				provider = "line_percentage",
				hl = {
					fg = "aqua",
					bg = "darkblue",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
		}

		local components = {
            -- Components for active window
			active = {
                {
                    c.gitBranch,
                    c.gitDiffAdded,
                    c.gitDiffRemoved,
                    c.gitDiffChanged,
                    c.fileinfo,
                    c.function_scope
                },
                {},
                {
                    c.diagnostic_errors,
                    c.diagnostic_warnings,
                    c.diagnostic_hints,
                    c.diagnostic_info,
                    c.lsp_client_names,
                    c.formatters,
                    -- c.file_encoding,
                    c.position,
                    c.line_percentage,
                }
			},
            -- Components for inactive window
			inactive = {
                {
                    c.fileinfo
                },
                {},
                {}
			},
		}
		require("feline").setup({
			components = components,
			theme = one_monokai,
			vi_mode_colors = vi_mode_colors,
            custom_providers = custom_providers,
		})
        -- require("feline").winbar.setup()
	end,
}
