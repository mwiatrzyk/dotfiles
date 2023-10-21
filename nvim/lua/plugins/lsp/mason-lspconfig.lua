local g = require("globals")

local config = {
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = g.lsp_servers
}

return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require("mason-lspconfig").setup(config)
  end
}
