return {
	"s1n7ax/nvim-terminal",
	config = function()
		vim.o.hidden = true
		require("nvim-terminal").setup({
			-- disable_default_keymaps = true,
			-- keymap to toggle open and close terminal window
			toggle_keymap = "<leader>;",

			-- increase the window height by when you hit the keymap
			window_height_change_amount = 2,

			-- increase the window width by when you hit the keymap
			window_width_change_amount = 2,

			-- keymap to increase the window width
			increase_width_keymap = "<leader><leader>ti",

			-- keymap to decrease the window width
			decrease_width_keymap = "<leader><leader>td",

			-- keymap to increase the window height
			increase_height_keymap = "<leader><leader>t+",

			-- keymap to decrease the window height
			decrease_height_keymap = "<leader><leader>t-",

			terminals = {
				-- keymaps to open nth terminal
				{ keymap = "<leader><leader>t1" },
				{ keymap = "<leader><leader>t2" },
				{ keymap = "<leader><leader>t3" },
				{ keymap = "<leader><leader>t4" },
				{ keymap = "<leader><leader>t5" },
			},
		})
	end,
}
