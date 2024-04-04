return {
	{
		"NeogitOrg/neogit",
        event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
        opts = {
            -- disable_line_numbers = false,
            signs = {
                -- { CLOSED, OPENED }
                hunk = { "+", "-" },
                item = { ">", "v" },
                section = { ">", "v" },
            },
        },
		config = function(_, opts)
			local neogit = require("neogit")
			neogit.setup(opts)
			vim.keymap.set("n", "<leader>og", neogit.open, { desc = "Open Neogit" })
		end,
	},
    {
        'echasnovski/mini.diff',
        version = false,
        opts = {
            mappings = {
                apply = '<leader>ga',
                reset = '<leader>gH',
                textobject = 'gh',
                goto_first = '<leader>gf',
                goto_prev = '<leader>gp',
                goto_next = '<leader>gn',
                goto_last = '<leader>gl',
            },
            view = {
                style = "sign",
            },
        },
        config = function (_, opts)
            require("mini.diff").setup(opts)
            vim.keymap.set("n", "<leader>go", require("mini.diff").toggle_overlay, { desc = "Toggle overlay" })
        end
    },
    -- {
        -- 	"lewis6991/gitsigns.nvim",
        -- 	config = function()
            -- 		require("gitsigns").setup({
                -- 			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                -- 			current_line_blame_opts = {
                    -- 				virt_text = true,
                    -- 				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    -- 				delay = 100,
                    -- 				ignore_whitespace = false,
                    -- 			},
                    -- 			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                    -- 			on_attach = function(bufnr)
                        -- 				local gs = package.loaded.gitsigns

                        -- 				local function map(mode, l, r, opts)
                            -- 					opts = opts or {}
                            -- 					opts.buffer = bufnr
                            -- 					vim.keymap.set(mode, l, r, opts)
                            -- 				end

                            -- 				-- Navigation
                            -- 				map("n", "<leader>gg", function()
                                -- 					if vim.wo.diff then
                                -- 						return "<leader>gg"
                                -- 					end
                                -- 					vim.schedule(function()
                                    -- 						gs.next_hunk()
                                    -- 					end)
                                    -- 					return "<Ignore>"
                                    -- 				end, { expr = true, desc = "Jump to next hunk" })
                                    -- 				map("n", "<leader>gz", function()
                                        -- 					if vim.wo.diff then
                                        -- 						return "<leader>gz"
                                        -- 					end
                                        -- 					vim.schedule(function()
                                            -- 						gs.prev_hunk()
                                            -- 					end)
                                            -- 					return "<Ignore>"
                                            -- 				end, { expr = true, desc = "Jump to previous hunk" })

                                            -- 				-- Actions
                                            -- 				map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
                                            -- 				map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
                                            -- 				map("v", "<leader>gs", function()
                                                -- 					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                                                -- 				end, { desc = "Stage hunk" })
                                                -- 				map("v", "<leader>gr", function()
                                                    -- 					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                                                    -- 				end, { desc = "Reset hunk" })
                                                    -- 				map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
                                                    -- 				map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
                                                    -- 				map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
                                                    -- 				map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
                                                    -- 				map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
                                                    -- 				map("n", "<leader>gd", gs.diffthis, { desc = "Show difference" })
                                                    -- 				map("n", "<leader>gt", gs.toggle_deleted, { desc = "Toggle deleted" })
                                                    -- 			end,
                                                    -- 		})
                                                    -- 	end,
                                                    -- },
                                                }
