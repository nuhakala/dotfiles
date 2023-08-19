return {
	"feline-nvim/feline.nvim",
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
						type = "base-only",
					},
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
				provider = "git_branch",
				hl = {
					fg = "peanut",
					style = "bold",
				},
				left_sep = "block",
				right_sep = "block",
			},
			gitDiffAdded = {
				provider = "git_diff_added",
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
				provider = "git_diff_removed",
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
				provider = "git_diff_changed",
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
		}

		local left = {
      -- c.separator,
			-- c.vim_mode,
			c.gitBranch,
			c.gitDiffAdded,
			c.gitDiffRemoved,
			c.gitDiffChanged,
      -- c.separator,
			c.fileinfo,
		}

		local middle = {
			-- c.fileinfo,
		}

		local right = {
			c.diagnostic_errors,
			c.diagnostic_warnings,
			c.diagnostic_hints,
			c.diagnostic_info,
			c.lsp_client_names,
			c.file_encoding,
			c.position,
		}

		local components = {
			active = {
				left,
				middle,
				right,
			},
			inactive = {
				left,
				middle,
				right,
			},
		}
		require("feline").setup({
			components = components,
			theme = one_monokai,
			vi_mode_colors = vi_mode_colors,
		})
	end,
}
