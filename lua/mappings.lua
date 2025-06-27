require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ":", ";")
map("i", "jk", "<ESC>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "<leader>p", [["_dP]])
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

map("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "CopilotChat - Open chat" })
map("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
map("n", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "CopilotChat - Review code" })
map("n", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "CopilotChat - Fix code" })
map("n", "<leader>co", "<cmd>CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
map("n", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "CopilotChat - Generate docs" })
map("n", "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "CopilotChat - Stop current request" })
map("n", "<leader>cl", "<cmd>CopilotChatReset<CR>", { desc = "CopilotChat - Reset chat" })

map("v", "<leader>cc", "<cmd>CopilotChatVisual<CR>", { desc = "CopilotChat - Chat with selection" })
map("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - Explain selection" })
map("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "CopilotChat - Review selection" })
map("v", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "CopilotChat - Fix selection" })
map("v", "<leader>co", "<cmd>CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize selection" })
map("v", "<leader>cd", "<cmd>CopilotChatDocs<CR>", { desc = "CopilotChat - Generate docs for selection" })

map("n", "<leader>cq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp", size = 0.35 }
end, { desc = "Terminal - Vertical" })

