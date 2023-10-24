-- My plugin for block commenting/uncommenting

-- Configuration
local config = {
  filetypes = {
    py = '# ',
    lua = '-- ',
    js = '// ',
    c = '// ',
    cpp = '// ',
  }
}

local get_file_type = function ()
  local name = vim.api.nvim_buf_get_name(0)
  local pos = name:find("[.].*$")
  if pos == nil then
    return nil
  end
  return name:sub(pos+1)
end

local get_selected_range = function ()
  local vpos = vim.fn.getpos("v")
  local start_row = vpos[2]
  local end_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  if start_row > end_row then
    return {end_row, start_row}
  else
    return {start_row, end_row}
  end
end

local get_comment_string = function ()
  local ft = get_file_type()
  if ft == nil then
    vim.print("Block comment not supported for this buffer")
    return nil
  end
  local comment_string = config.filetypes[ft]
  if comment_string == nil then
    vim.print("Block comment not configured for: " .. ft)
    return nil
  end
  return comment_string
end

local comment_block = function ()
  local comment_string = get_comment_string()
  if comment_string == nil then
    return
  end
  local start_row, end_row = unpack(get_selected_range())
  local rows = vim.api.nvim_buf_get_lines(0, start_row-1, end_row, true)
  for i, _ in pairs(rows) do
    rows[i] = comment_string .. rows[i]
  end
  vim.api.nvim_buf_set_lines(0, start_row-1, end_row, true, rows)
  vim.api.nvim_input("<esc>")
end

local uncomment_block = function ()
  local comment_string = get_comment_string()
  if comment_string == nil then
    return
  end
  local comment_string_len = comment_string:len()
  local start_row, end_row = unpack(get_selected_range())
  local rows = vim.api.nvim_buf_get_lines(0, start_row-1, end_row, true)
  for i, _ in pairs(rows) do
    local prefix = rows[i]:sub(1, comment_string_len)
    if prefix == comment_string then
      rows[i] = rows[i]:sub(comment_string_len+1)
    end
  end
  vim.api.nvim_buf_set_lines(0, start_row-1, end_row, true, rows)
  vim.api.nvim_input("<esc>")
end

return {
  comment_block = comment_block,
  uncomment_block = uncomment_block,
}
