return {
    "folke/trouble.nvim",
    branch = "dev",
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)", },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)", },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", },
    },
    -- dependencies = {"nvim-tree/nvim-web-devicons",},
    opts = {},
--     config = function()
--         vim.keymap.set("n", "<leader>xx", "<Cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
--         vim.keymap.set( "n", "<leader>xw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggle workspace diagnostics" })
--         vim.keymap.set( "n", "<leader>xd", "<Cmd>TroubleToggle document_diagnostics<CR>", { desc = "Toggle document diagnostics" })
--         vim.keymap.set("n", "<leader>xq", "<Cmd>TroubleToggle quickfix<CR>", { desc = "Toggle Trouble quickfix" })
--         vim.keymap.set("n", "<leader>xl", "<Cmd>TroubleToggle loclist<CR>", { desc = "Toggle Trouble location list" })

--         -- Set keymaps for LSP-features
--         vim.keymap.set("n", "gd", function() require("trouble").open("lsp_definitions") end, { desc = "Definition" })
--         vim.keymap.set("n", "go", function() require("trouble").open("lsp_type_definitions") end, { desc = "Type definitions" })
--         vim.keymap.set("n", "gr", function() require("trouble").open("lsp_references") end, { desc = "References" })

--     end,
}
