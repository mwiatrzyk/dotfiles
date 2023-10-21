  -- Signature help during typing
local config = {}
return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require('lsp_signature').setup(config)
  end
}
