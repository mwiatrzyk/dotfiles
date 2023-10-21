local config = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

return {
  'williamboman/mason.nvim',
  config = function()
    require("mason").setup(config)
  end
}
