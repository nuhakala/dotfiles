-- This is a small function toggling autocommand on/off. Autocommand does autosaving.

local enabled = false

function toggle_autosave()
	if enabled then
		vim.api.nvim_clear_autocmds({ group = "autosave" })
	else
		vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
			group = autosave,
			callback = function(args)
				vim.cmd("wa")
			end,
		})
	end
end

-- enable by default
-- toggle_autosave()
-- vim.keymap.set("n", "<leader>+", toggle_autosave, { desc = "Toggle autosave" })
