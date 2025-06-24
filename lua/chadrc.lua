-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tokyonight",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
	statusline = {
		theme = "default",
		separator_style = "default",
		order = { "mode", "file", "git", "%=", "diagnostics", "lsp_msg", "custom_lsp", "cwd", "cursor" },
		modules = {
			custom_lsp = function()
				local clients = vim.lsp.get_clients { bufnr = 0 }
				local lsp_clients = {}

				for _, client in pairs(clients) do
					local client_name_lower = client.name:lower()
					if not (client_name_lower:match("copilot") or client_name_lower:match("github")) then
						table.insert(lsp_clients, client.name)
					end
				end

				if #lsp_clients == 0 then
					return ""
				end

				local unique_clients = {}
				local seen = {}
				for _, client in ipairs(lsp_clients) do
					if not seen[client] then
						seen[client] = true
						table.insert(unique_clients, client)
					end
				end

				local lsp_string = table.concat(unique_clients, ", ")
				return "%#St_lsp#  " .. lsp_string .. " %#St_lsp_sep#"
			end,
		},
	},
}

return M
