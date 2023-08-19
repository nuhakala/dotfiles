return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	lazy = false,
	config = function()
		-- NOTE: If we set this under opts, ts-context-commentstring prehook
		-- wont work.
		require("Comment").setup({
			--Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>cc",
				---Block-comment toggle keymap
				block = "<leader>cb",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<leader>cc",
				---Block-comment keymap
				block = "<leader>cb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "<leader>cO",
				---Add comment on the line below
				below = "<leader>co",
				---Add comment at the end of line
				eol = "<leader>cA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping
				basic = true,
				---Extra mapping
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			---Function to call after (un)comment
			post_hook = nil,
		})
	end,
}
