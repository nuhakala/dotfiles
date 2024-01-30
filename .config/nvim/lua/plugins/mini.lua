return {
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.align",
		version = false,
		config = function()
			require("mini.align").setup({
				mappings = {
					start = "<leader>a",
					start_with_preview = "<leader>A",
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>na", -- Add surrounding in Normal and Visual modes
					delete = "<leader>nd", -- Delete surrounding
					find = "<leader>nf", -- Find surrounding (to the right)
					find_left = "<leader>nF", -- Find surrounding (to the left)
					highlight = "<leader>nh", -- Highlight surrounding
					replace = "<leader>nr", -- Replace surrounding
					update_n_lines = "<leader>nn", -- Update `n_lines`

                    suffix_last = "<leader>nl", -- Suffix to search with "prev" method
					suffix_next = "<leader>nt", -- Suffix to search with "next" method
				},
			})
		end,
	},
	{
		"echasnovski/mini.sessions",
		version = false,
		config = function()
			require("mini.sessions").setup({
                autoread = true,
                hooks = {
                    post = { read = function ()
                        -- mini.sessions does not execute post-session autocommand
                        -- for whatever reason, so we have to load arrow cache file here
                        -- to make it work.
                        require("arrow.git").refresh_git_branch()
                        require("arrow.persist").load_cache_file()
                    end, write = nil, delete = nil },
                },
            })

			-- Setup commands for saving
			local ms = require("mini.sessions")

			-- Keymaps to save and read the session
			vim.keymap.set("n", "<leader>sw", function ()
			 vim.ui.input({prompt = "Session name to write"}, function (input)
                 if input == nil then return end
			     ms.write(input)
			 end)
            end, { desc = "Save session" })
			vim.keymap.set("n", "<leader>sr", function()
			 vim.ui.input({prompt = "Session name to read"}, function (input)
                 if input == nil then return end
			     ms.read(input)
			 end)
            end, { desc = "Read session" })
			vim.keymap.set("n", "<leader>sd", function()
			 vim.ui.input({prompt = "Session name to delete"}, function (input)
                 if input == nil then return end
			     ms.delete(input)
			 end)
            end, { desc = "Delete session" })
			vim.keymap.set("n", "<leader>si", function()
			 vim.ui.input({prompt = "Write action to take"}, function (input)
                 if input == nil then return end
			     ms.select(input)
			 end)
            end, { desc = "Interactively select action" })
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
        -- opts = {
        --     mappings = {
        --         toggle = "gt",
        --     }
        -- },
		config = true,
	}
}
