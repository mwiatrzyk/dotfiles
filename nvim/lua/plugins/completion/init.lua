return {
  require("plugins.completion.nvim-cmp"),
  { 'hrsh7th/cmp-buffer', dependencies = {'nvim-cmp'}},
  { 'hrsh7th/cmp-cmdline', dependencies = {'nvim-cmp'}},
  { 'hrsh7th/cmp-nvim-lsp', dependencies = {'nvim-cmp'}},
  { 'hrsh7th/cmp-path', dependencies = {'nvim-cmp'}},
}
