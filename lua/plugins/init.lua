return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "prisma/vim-prisma",
    ft = "prisma",
    config = function()
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.prisma",
        command = "set filetype=prisma",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 1000, -- Load Mason first
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        automatic_installation = true,
      }
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    priority = 999,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "bashls",
          "clangd",
          "cssls",
          "docker_compose_language_service",
          "dockerls",
          "jsonls",
          "lua_ls",
          "prismals",
          "rust_analyzer",
          "ts_ls",
          "yamlls",
          "solidity_ls_nomicfoundation",
        },
        automatic_installation = true,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 998,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
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

      -- Server configurations
      local servers = {
        bashls = {},
        cssls = {},
        rust_analyzer = {},
        jsonls = {},
        lua_ls = {},
        clangd = {},
        ts_ls = {},
        dockerls = {},
        docker_compose_language_service = {},
        yamlls = {},
        prismals = {},
        solidity_ls_nomicfoundation = {},
      }

      -- Setup each server
      for server, config in pairs(servers) do
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["copilot-chat"] = false,
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("CopilotChat").setup {
        model = "claude-sonnet-4",
      }
    end,
    cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatExplain" },
  },
}
