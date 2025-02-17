require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
  }
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- C++
lspconfig.clangd.setup({
  cmd = { "clangd", "--compile-commands-dir=build" },
  capabilities = capabilities
})

-- Lua
lspconfig.lua_ls.setup({ capabilities = capabilities })

-- Python
lspconfig.pyright.setup({ capabilities = capabilities })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show docs" })
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "Rename" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show issues" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous issue" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next issue" })

vim.keymap.set("n", "<leader>ad", ":lua require('neogen').generate()<CR>", {noremap=true, silent=true})
