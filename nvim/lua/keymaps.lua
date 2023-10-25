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
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Toggle nvim.tree
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', opts)

-- Telescope key bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
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
