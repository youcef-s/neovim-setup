local M = {}

M.lsp_client = function()
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
  return "  " .. lsp_string .. " "
end

M.lsp = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local lsp_string = M.lsp_client()
  if lsp_string == "" then
    return ""
  end

  return "%#St_lsp#" .. lsp_string .. "%#St_lsp_sep#" .. ""
end

return M
