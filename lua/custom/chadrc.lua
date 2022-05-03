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

-- setup msys2 on windows
function setup_msys2()
    shell_executable = os.getenv('SHELL')
    -- print(shell_executable)
    if string.find(shell_executable, "msys64") then
        -- print(shell_executable .. "uuuuuuuuuu")
        vim.o.shellcmdflag = '-c'
        vim.o.shellxquote = '('
        vim.o.shellslash = nil
    end

    -- let &shellcmdflag = '-c'
    -- set shellxquote=(
    -- set shellslashnd
end
setup_msys2()

return M

