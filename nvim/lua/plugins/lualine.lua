-- Status bar

local active_python_venv = function ()
  local vs = require("venv-selector")
  local ft = vim.bo.filetype
  if ft ~= "python" then
    return ""  -- don't ask for active venv if this is not Python
  end
  local venv = vs.get_active_venv()
  if venv == nil then
    return "venv: nil"
  end
  return "venv: " .. vim.fs.basename(venv)
end

local change_python_venv = function ()
  vim.cmd("VenvSelect")
end

local config = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'NvimTree'},
      winbar = {'NvimTree'},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype', {active_python_venv, on_click=change_python_venv}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = config
}
