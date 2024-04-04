---@module BufOnly
---@author Jäbä
---@license MIT
-- Small function and keybind for deleting all but current buffer. Based on
-- https://github.com/numToStr/BufOnly.nvim

local api = vim.api
local option = api.nvim_buf_get_option

function BufOnly()

    local cur = api.nvim_get_current_buf()

    local deleted, modified = 0, 0

    for _, n in ipairs(api.nvim_list_bufs()) do
        -- If the iter buffer is modified one, then don't do anything
        if option(n, "modified") then
            -- iter is not equal to current buffer
            -- iter is modifiable
            -- `modifiable` check is needed as it will prevent closing file tree ie. NERD_tree
            modified = modified + 1
        elseif n ~= cur and (option(n, "modifiable")) then
            api.nvim_buf_delete(n, {})
            deleted = deleted + 1
        end
    end

    print("BufOnly: " .. deleted .. " deleted buffer(s), " .. modified .. " modified buffer(s)")
end

vim.keymap.set("n", "<leader>db", BufOnly, { desc = "Delete all but current buffer" })
