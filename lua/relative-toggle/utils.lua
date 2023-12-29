local config = require("relative-toggle.config")

local M = {}

local function create_autocmd(event, opts)
    local success, error = pcall(vim.api.nvim_create_autocmd, event, opts)
    if not success then
        print("Error creating autocmd:", error)
    end
end

local function set_relativenumber(relative, redraw)
    if not vim.g.relativenumber then
        return
    end

    if not vim.o.number and not vim.o.relativenumber then
        return
    end

    local in_insert_mode = vim.api.nvim_get_mode().mode == "i"

    vim.opt.number = not relative or in_insert_mode or current_number
    vim.opt.relativenumber = relative and not in_insert_mode

    if redraw then
        vim.cmd("redraw")
    end
end

M.create_autocmd = create_autocmd
M.set_relativenumber = set_relativenumber

return M
