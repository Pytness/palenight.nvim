local M = {}

--- @param colors PalenightColors
function M.set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.dark_green
  vim.g.terminal_color_3 = colors.dark_yellow
  vim.g.terminal_color_4 = colors.dark_blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.dark_cyan
  vim.g.terminal_color_7 = colors.white

  vim.g.terminal_color_8 = colors.visual_grey
  vim.g.terminal_color_9 = colors.light_red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.light_purple
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.comment_grey
  vim.g.terminal_color_background = colors.black
  vim.g.terminal_color_foreground = colors.white
end

return M
