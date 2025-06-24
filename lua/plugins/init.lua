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
    version = "~1.11.0",
    lazy = false,
    priority = 1000,
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 998,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "~1.32.0",
    lazy = false,
    priority = 997,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
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
        },
        automatic_installation = true,
      }
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      })
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "json",
        "json5",
        "jsonc",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "go",
        "c",
        "cpp",
        "java",
        "bash",
        "yaml",
        "toml",
        "dockerfile",
        "gitignore",
        "sql",
        "prisma",
        "graphql",
        "vue",
        "php",
        "regex",
        "xml",
        "solidity",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
      })
    end,
  },
}
