  -- Treesitter (for better code highlighting)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
          "c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "css",
          "python",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
  end
}
