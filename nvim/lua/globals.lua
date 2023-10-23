-- Configuration globals

-- List of LSP servers to enable.
-- Run: :help lspconfig-all to see available options.
-- Alternatively, proceed to: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lsp_servers = {
  'lua_ls',
  'pyright',
  'html',
  'cssls',
}

return {
  lsp_servers = lsp_servers
}
