return {
    "numToStr/Comment.nvim",
    -- dependencies = {
    --     "JoosepAlviste/nvim-ts-context-commentstring",
    -- },
    lazy = false,
    config = function ()
        require("Comment").setup({
            padding = true,
            sticky = true,
            ignore = '^$',
            -- toggler = {
            --     line = '<leader>cc',
            --     block = '<leader>bc',
            -- },
            -- opleader = {
            --     line = '<leader>c',
            --     block = '<leader>b',
            -- },
            -- extra = {
            --     above = '<leader>cO',
            --     below = '<leader>co',
            --     eol = '<leader>cA',
            -- },
            mappings = {
                basic = true,
                extra = true,
            },
            -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            post_hook = nil,
        })
    end,
}
