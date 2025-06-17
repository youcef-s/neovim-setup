-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "falcon",

	hl_override = {
		Visual = { bg = "#2F2C2B", fg = "#ffffff" },

		Search = { bg = "#f0a988", fg = "#000000" },

		DiagnosticError = { fg = "#ff6c6b" },
		DiagnosticWarn = { fg = "#ecbe7b" },
	},

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
