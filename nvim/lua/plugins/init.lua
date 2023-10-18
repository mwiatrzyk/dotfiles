-- List plugins to install here
require("lazy").setup({
    -- File browsing plugin
    {
          "nvim-tree/nvim-tree.lua",
          version = "*",
          lazy = false,
          dependencies = {
                "nvim-tree/nvim-web-devicons",
          },
          config = function()
                require("plugins/nvim-tree")
          end,
    }
})
