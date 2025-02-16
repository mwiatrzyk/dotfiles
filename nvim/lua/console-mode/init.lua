-- SETTINGS

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- use spaces for tabs

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true             -- highlight matches

-- MAPPINGS

-- Move across windows (Ctrl+Arrows)
vim.keymap.set('n', '<C-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<C-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<C-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<C-Right>', '<C-w>l', opts)

-- Resize windows (Ctrl+Shift+Arrows)
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-S-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-S-Right>', ':vertical resize -2<CR>', opts)

-- PLUGIN INSTALLATION

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

-- Install required plugins
require("lazy").setup({
  -- Color scheme plugin.
  {"catppuccin/nvim", name="catppuccin", priority=1000},
  -- File list plugin
  {"nvim-tree/nvim-tree.lua", lazy=false, dependencies={"nvim-tree/nvim-web-devicons"}},  -- TODO: what does lazy=false do?
  -- Buffer list plugin
  {'akinsho/bufferline.nvim', dependencies='nvim-tree/nvim-web-devicons'},
  -- Status line plugin
  {'nvim-lualine/lualine.nvim', dependencies={'nvim-tree/nvim-web-devicons'}},
  -- Automatically exit from hlsearch
  {
    'nvimdev/hlsearch.nvim',
    event='BufRead',
    config = function()
      require('hlsearch').setup()
    end
  },
  -- Treesitter for better code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "html",
          "css",
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
  -- Telescope for fuzzy search and finding files
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- LSP plugins
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require('lsp_signature').setup(config)
    end
  },
})

require("console-mode.colorscheme")
require("console-mode.explorer")
require("console-mode.tabs")
require("console-mode.status")
require("console-mode.searching")
require("console-mode.lsp")
require("console-mode.cmp")

-- -- Import settings & other configs
-- require("options")
-- require("keymaps")
