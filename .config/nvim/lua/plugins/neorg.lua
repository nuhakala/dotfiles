return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- lazy = true,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "numToStr/Comment.nvim"},
        { "nvim-neorg/neorg-telescope"},
        -- { "samodostal/image.nvim" }, -- requires nvim 10+
        -- {
            -- 	"pysan3/neorg-templates",
            -- 	dependencies = { "L3MON4D3/LuaSnip" },
            -- },
            -- { "pritchett/neorg-capture" },
        },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.integrations.telescope"] = {},
                    ["core.export"] = {},

                    ["core.defaults"] = {
                        config = {
                            disable = {
                                -- "core.itero",
                                "core.journal",
                            },
                        },
                    }, -- Loads default behaviour
                    ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            -- bpm = "~/filen-drive/muistiinpanot/bpm/",
                            -- str = "~/filen-drive/muistiinpanot/str/",
                            -- conc = "~/filen-drive/muistiinpanot/conc/",
                            -- linux = "~/filen-drive/muistiinpanot/linux/",
                            -- hpc = "~/filen-drive/muistiinpanot/hpc/",
                            notes = "~/filen-drive/muistiinpanot/",
                            -- sekalaiset = "~/filen-drive/muistiinpanot/sekalaiset/",
                            -- historia = "~/filen-drive/muistiinpanot/historia/",
                        },
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                        hook = function(keybinds)
                            -- <M-CR> launches terminal in WM
                            -- In insert mode, this creates new list item
                            keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
                            -- In normal mode, opens a link to vertical split
                            keybinds.remap_key("norg", "n", "<M-CR>", "<S-CR>")
                            keybinds.map("norg", "n", keybinds.leader .. "mi", "<CMD>Neorg index<CR>")
                            keybinds.map("norg", "n", keybinds.leader .. "g", "<CMD>Neorg generate-workspace-summary<CR>", { desc = "Generate summary" })
                            keybinds.unmap("norg", "n", keybinds.leader .. "nn")

                            -- Telescope
                            keybinds.remap_event("norg", "n", keybinds.leader .. "fl", "core.integrations.telescope.find_linkable", { desc = "Neorg find linkable" })
                            keybinds.remap_event("norg", "n", keybinds.leader .. "ff", "core.integrations.telescope.find_norg_files", { desc = "Neorg find file" })
                            keybinds.remap_event("norg", "n", keybinds.leader .. "il", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
                            keybinds.remap_event("norg", "n", keybinds.leader .. "if", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })
                            keybinds.remap_event("norg", "i", "<C-s>", "core.integrations.telescope.insert_link", { desc = "Neorg insert link" })
                            keybinds.remap_event("norg", "i", "<C-h>", "core.integrations.telescope.insert_file_link", { desc = "Neorg insert link" })

                            vim.keymap.set("n", "<localleader>nn", function ()
                                local dirman = require('neorg').modules.get_module("core.dirman")

                                -- Get file name + title from user
                                local user_input = vim.fn.input("Enter note name: ")
                                local title = ""
                                for str in string.gmatch(user_input, "([^_]+)") do
                                    title = title .. str .. " "
                                end
                                title = string.sub(title, 1, -2) -- remove whitespace

                                -- Get subfolder
                                local file_path = vim.api.nvim_buf_get_name(0)
                                local path = vim.fs.dirname(file_path)
                                local ws = dirman.get_current_workspace()[2]
                                if path ~= ws then
                                    path = string.sub(path, string.len(ws), -1)
                                else
                                    path = ""
                                end

                                dirman.create_file(path.."/"..user_input, nil, {
                                    no_open  = false,  -- open file after creation?
                                    force    = false,  -- overwrite file if exists
                                    metadata = {
                                        title = require("neorg.core").lib.title(title),
                                    }
                                })

                                -- Set cursor to after metadata
                                vim.api.nvim_buf_set_lines(0, 10, 10, false, { "" })
                                vim.api.nvim_win_set_cursor(0, { 11, 0 })
                            end, { desc = "Create New Note" })
                        end,
                    },
                },
                ["core.summary"] = {
                    config = {
                        strategy = "current_dir",
                    }
                },

                -- requires nvim 10+
                -- ["core.integrations.image"] = {},
                -- ["core.latex.renderer"] = {},

                -- ["external.templates"] = {},
                -- ["external.capture"] = {},
            },
        })

        local ft = require('Comment.ft')
        ft.norg = {"%%s%", '%%s%'}
    end,
}
