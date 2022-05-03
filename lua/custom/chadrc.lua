-- Just an example, supposed to be placed in /lua/custom/
--
local map = require("core.utils").map
local buf_map = require("core.utils").buf_map
local userPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyonight",
}

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "lua",
        "vim",
        "cpp",
        "c",
        "python",
        "json",
        "javascript",
        "typescript",
      }
    },
  },
  user = userPlugins,
  options = {
      lspconfig = {
          setup_lspconf = "custom.configs.lspconfig"
      }
  }
}

map("n", "<leader>wo", ":only <CR>")
map("n", "<leader>wq", ":quit <CR>")
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>fr", ":Telescope lsp_references")

vim.opt.shiftwidth = 4

return M

