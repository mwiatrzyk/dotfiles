-- Buffer line (i.e. tabs)
local config = {}
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup(config)
  end
}
