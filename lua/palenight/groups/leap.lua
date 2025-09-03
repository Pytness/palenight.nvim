local colors = require 'palenight.colors'
local M = {}
M.generate = function(colors)
  return {
    LeapBackdrop = { link = 'Comment' },
    LeapMatch = {
      fg = colors.white,
      bold = true,
      nocombine = true,
    },
    LeapLabel = {
      bg = colors.black,
      fg = colors.leap_primary_label,
      bold = false,
      nocombine = true,
    },
    LeapLabelDimmed = {
      bg = colors.black,
      fg = colors.leap_secondary_label,
      bold = false,
      nocombine = true,
    },
  }
end

return M
