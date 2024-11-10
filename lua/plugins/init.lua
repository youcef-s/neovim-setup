return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require "lspconfig"
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            vim.diagnostic.open_float(nil, { focusable = false })
          end,
        })
      end

      local servers = {
        "rust_analyzer",
        "jsonls",
        "lua_ls",
        "clangd",
        "ts_ls",
        "dockerls",
        "docker_compose_language_service",
        "yamlls",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          on_attach = on_attach,
        }
      end
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    event = "BufEnter",
  },
  opts = require "configs.conform",
}
