return {
	---[[
	--[=[]]
	{
	    'simonmclean/triptych.nvim',
	    event = 'VeryLazy',
	    dependencies = {
	       'nvim-lua/plenary.nvim', -- required
	        'nvim-tree/nvim-web-devicons', -- optional
	    },
	    config = function ()
	        require 'triptych'.setup({
                options = {
                    line_numbers = {
                        relative = true,
                    }
                }
            })
	        vim.keymap.set('n', '-', ':Triptych<CR>', { silent = true })
	    end
	},
    --]=]
    --[=[
	{
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup({
				picker = {
					session = "local",
				},
			})
			vim.keymap.set("n", "<leader>oh", "<CMD>NnnPicker<CR>", { desc = "Open NNN" })
			vim.keymap.set("n", "<leader>oe", "<CMD>NnnExplorer<CR>", { desc = "Open NNN" })
		end,
	},
    --]=]
}
