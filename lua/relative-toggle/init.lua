local config = require("relative-toggle.config")
local utils = require("relative-toggle.utils")

local M = {}

function M.setup(options)
	local plugin_config = vim.tbl_deep_extend("force", config.default_config, options or {})

	vim.opt.relativenumber = plugin_config.relativenumber
	vim.g.relativenumber = plugin_config.relativenumber

	local augroup = vim.api.nvim_create_augroup("relative-toggle", {})

	utils.create_autocmd(plugin_config.events.on, {
		pattern = plugin_config.pattern,
		group = augroup,
		desc = "turn relative number on",
		callback = function(ev)
			utils.set_relativenumber(true, ev.event == "CmdlineEnter")
		end,
	})

	utils.create_autocmd(plugin_config.events.off, {
		pattern = plugin_config.pattern,
		group = augroup,
		desc = "turn relative number off",
		callback = function(ev)
			utils.set_relativenumber(false, ev.event == "CmdlineEnter")
		end,
	})

	vim.api.nvim_create_user_command("ToggleRelativeNumber", function()
		vim.g.relativenumber = not vim.g.relativenumber
		vim.cmd(vim.g.relativenumber and "set relativenumber" or "set norelativenumber")
	end, {})
end

return M
