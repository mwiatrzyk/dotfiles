  -- CONFIGURATION

  local tree = require("nvim-tree")
  tree.setup({
    view = {
      width = 30
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
  })

-- MAPPINGS

-- Toggle file list
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', opts)
