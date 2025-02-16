-- MAPPINGS

-- Switching between tabs with Alt+Num
local make_alt_num_handler = function (num)
  return function ()
    vim.cmd('BufferLineGoToBuffer '..num)
  end
end

for i=1,9 do
  vim.keymap.set('n', '<A-'..i..'>', make_alt_num_handler(i), opts)
end

-- CONFIGURATION

local config = {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    },
  }
}

require("bufferline").setup(config)
