-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  -- "folke/which-key.nvim",
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- "folke/neodev.nvim",

  -- Color scheme plugin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Code completions
  { 'neovim/nvim-lspconfig' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.nvim-cmp')
    end
  },
  { 'hrsh7th/cmp-nvim-lsp', dependencies = {'nvim-cmp'}},
  { 'hrsh7th/cmp-buffer', dependencies = {'nvim-cmp'}},        -- buffer auto-completion
  { 'hrsh7th/cmp-path', dependencies = {'nvim-cmp'}},          -- path auto-completion
  { 'hrsh7th/cmp-cmdline', dependencies = {'nvim-cmp'}},       -- cmdline auto-completion
  { 'L3MON4D3/LuaSnip'},
  { 'saadparwaiz1/cmp_luasnip'},

  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim'},

  -- Signature help during typing
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require('lsp_signature').setup({})
    end
  },

  -- Treesitter (for better code highlighting)
  {
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
  },

  -- Remove trailing whitespace
  {
    "mcauley-penney/tidy.nvim",
    config = {
      filetype_exclude = {
        "markdown",
        "diff"
      }
    },
  },

  -- Status bar
  { 'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},

  -- Buffer line (i.e. tabs)
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
})
