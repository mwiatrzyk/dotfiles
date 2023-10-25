local bc = require("blockcomment")

-- define common options
local opts = {
  noremap = true,      -- non-recursive
  silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-Left>', '<C-w>h', opts)
vim.keymap.set('n', '<C-Down>', '<C-w>j', opts)
vim.keymap.set('n', '<C-Up>', '<C-w>k', opts)
vim.keymap.set('n', '<C-Right>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-k>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-j>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-h>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-l>', ':vertical resize -2<CR>', opts)

-- Toggle nvim.tree
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', opts)

-- Telescope key bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- Switching between bufferline tabs
local make_alt_num_handler = function (num)
  return function ()
    vim.cmd('BufferLineGoToBuffer '..num)
  end
end

for i=1,9 do
  vim.keymap.set('n', '<A-'..i..'>', make_alt_num_handler(i), opts)
end

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Comment block
vim.keymap.set('v', '<leader>c', bc.comment_block, opts)
vim.keymap.set('v', '<leader>u', bc.uncomment_block, opts)
