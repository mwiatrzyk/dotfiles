vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "python", "lua", "sh", "markdown" },
  callback = function()
    vim.opt.list = true
    vim.opt.listchars = {
      tab = "▸-",
      trail = "·",
      space = "·",
      nbsp = "␣"
    }
  end,
})

