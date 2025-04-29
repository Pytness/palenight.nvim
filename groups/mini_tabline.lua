local colors = require 'palenight.colors'

return {
  MiniTablineHidden = { bg = colors.cursor_grey, fg = colors.white },
  MiniTablineVisible = { bg = colors.cursor_grey, fg = colors.white },
  MiniTablineCurrent = { bg = colors.white_mask_3, fg = colors.white },

  MiniTablineModifiedHidden = { bg = colors.cursor_grey, fg = colors.green },
  MiniTablineModifiedVisible = { bg = colors.cursor_grey, fg = colors.green },
  MiniTablineModifiedCurrent = { bg = colors.white_mask_3, fg = colors.green },

  MiniStatuslineModeNormal = { bg = colors.blue, fg = colors.black },
  MiniStatuslineModeInsert = { bg = colors.yellow, fg = colors.black },
  MiniStatuslineModeVisual = { bg = colors.blue_purple, fg = colors.black },
  MiniStatuslineModeReplace = { bg = colors.green, fg = colors.black },
  MiniStatuslineModeCommand = { bg = colors.black, fg = colors.yellow },
  MiniStatuslineModeOther = { bg = colors.purple, fg = colors.black },
}
