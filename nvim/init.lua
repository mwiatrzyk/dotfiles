-- COMMON SETTINGS

-- The <leader> key
vim.g.mapleader = "\\"

-- COMMON KEYMAPS

local opts = {
  noremap = true,
  silent = true,
}

-- Visual mode

-- Indent/dedent selected code block
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Comment selected code block
local bc = require("blockcomment")
vim.keymap.set('v', '<leader>c', bc.comment_block, opts)
vim.keymap.set('v', '<leader>u', bc.uncomment_block, opts)

-- MODE-SPECIFIC CONFIGURATION

if vim.g.vscode then
  require("vscode-mode")
else
  require("console-mode")
end
