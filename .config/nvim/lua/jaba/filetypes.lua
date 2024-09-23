vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function(args)
		vim.opt.textwidth = 85
		vim.opt.autochdir = true
        vim.opt.colorcolumn = "85"
		-- vim.bo.commentstring = "%|%s|%"

        vim.keymap.set("i", "<S-CR>", "<Plug>(neorg.itero.next-iteration)", { buffer = true })
        vim.keymap.set("n", "<CR>", "<Plug>(neorg.esupports.hop.hop-link)", { desc = "[neorg] Jump to Link", buffer = true })
        vim.keymap.set("n", ">>", "<Plug>(neorg.promo.promote.nested)", { desc = "[neorg] Promote Object (Recursively)", buffer = true })
        vim.keymap.set("n", "<<", "<Plug>(neorg.promo.demote.nested)", { desc = "[neorg] Demote Object (Recursively)", buffer = true })

        -- Telescope
        vim.keymap.set("n", "<localleader>fl", "<Plug>(neorg.telescope.find_linkable)", { buffer = true })
        vim.keymap.set("n", "<localleader>ff", "<Plug>(neorg.telescope.find_norg_files)", { buffer = true })
        vim.keymap.set("n", "<localleader>il", "<Plug>(neorg.telescope.insert_link)", { desc = "Neorg insert link", buffer = true })
        vim.keymap.set("n", "<localleader>if", "<Plug>(neorg.telescope.insert_file_link)", { desc = "Neorg insert file link", buffer = true })
        -- vim.keymap.set("i", "<C-,>", "<Plug>(neorg.telescope.insert_link)", { desc = "Neorg insert link", buffer = true })
        -- vim.keymap.set("i", "<C-f>", "<Plug>(neorg.telescope.insert_file_link)", { desc = "Neorg insert link", buffer = true })

        vim.keymap.set("n", "<localleader>nn", function()
            local dirman = require("neorg").modules.get_module("core.dirman")

            vim.ui.input({ prompt = "Enter note name: " }, function(user_input)
                -- Cancelled input
                if not user_input or user_input == "" then
                    return
                end

                local file_name = user_input:gsub(" ", "_")
                local date = os.date("%Y-%m-%d--")
                local ws = dirman.get_current_workspace()[1]

                dirman.create_file(date .. file_name, ws, {
                    no_open = false, -- open file after creation?
                    force = false, -- overwrite file if exists
                    metadata = {
                        title = require("neorg.core").lib.title(user_input),
                        -- title = user_input,
                    },
                })

                -- Set cursor to after metadata
                vim.api.nvim_buf_set_lines(0, 10, 14, false, { "*Lähteet*:", "- %|TODO: lähde|%", "", ""})
                vim.api.nvim_win_set_cursor(0, { 14, 0 })
            end)
        end, { desc = "Create New Note", buffer = true })

        -- Create workspace summary using above line
        vim.keymap.set("n", "<localleader>g", function ()
            local current_line = vim.api.nvim_win_get_cursor(0)[1]
            local line = vim.api.nvim_buf_get_lines(0, current_line - 2, current_line - 1, false)[1]
            local cmd = string.sub(line, 2, -2)
            vim.cmd(cmd)
        end, { buffer = true })

        -- Undojoin
        vim.keymap.set("n", "u", function()
            require("neorg.modules.core.esupports.metagen.module").public.skip_next_update()
            local k = vim.api.nvim_replace_termcodes("u<c-o>", true, false, true)
            vim.api.nvim_feedkeys(k, 'n', false)
        end, { buffer = true })
        vim.keymap.set("n", "<c-r>", function()
            require("neorg.modules.core.esupports.metagen.module").public.skip_next_update()
            local k = vim.api.nvim_replace_termcodes("<c-r><c-o>", true, false, true)
            vim.api.nvim_feedkeys(k, 'n', false)
        end, { buffer = true })

    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.opt.textwidth = 80
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*/COMMIT_EDITMSG",
    command = "set filetype=markdown tw=72",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function (args)
        -- linux kernel coding style
        local tabs = 8
        vim.bo.tabstop = tabs
        vim.bo.softtabstop = tabs
        vim.bo.shiftwidth = tabs
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function (args)
        vim.opt.textwidth = 80
        vim.opt.colorcolumn = "80"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function (args)
        vim.opt.textwidth = 85
        vim.opt.colorcolumn = "85"
    end,
})
