-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { 
  "bashls",
  "clangd", 
  "cssls",
  "html",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  "lua_ls",
  "prismals",
  "rust_analyzer",
  "ts_ls",
  "yamlls",
  "solidity_ls_nomicfoundation",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
