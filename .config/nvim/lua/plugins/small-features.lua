return {
    { "lambdalisue/suda.vim" },
    { "HiPhish/jinja.vim" },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>ou", vim.cmd.UndotreeToggle, desc = "Open undotree" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            exclude = {
                filetypes = { "norg" },
            },
        },
    },
    {
        "nuhakala/nvim-simple-tables",
        event = "VeryLazy",
        config = true,
    },
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle", -- optional for lazy loading on command
        event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        opts = {
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- don't save for `oil` file types
                if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
                    return true
                end
                return false
            end,
        },
        config = true,
        keys = {
            { "<leader>+", ":ASToggle<CR>", desc = "Toggle auto-save" },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        version = "*",
        opts = {
            autochdir = true,
            direction = "tab",
            float_opts = {
                border = "double",
            },
        },
        keys = {
            { "<leader>ot", "<CMD>ToggleTerm direction=tab<CR>", desc = "Open terminal" },
            {
                "<leader>ov",
                "<CMD>ToggleTerm size=10 dir=./ direction=horizontal<CR>",
                desc = "Open terminal in horizontal split",
            },
        },
        config = true,
    },
    {
        "otavioschwanck/arrow.nvim",
        event = "VeryLazy",
        config = function()
            require("arrow").setup({
                show_icons = true,
                leader_key = "<leader>h", -- Recommended to be a single key
                index_keys = "aouhtns",
                save_path = function()
                    return os.getenv("HOME") .. "/.vim/arrow/"
                end,
            })
        end,
    },
}
