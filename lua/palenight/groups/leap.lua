local M = {}

--- @param colors PalenightColors
function M.generate(colors)
  return {
    LeapBackdrop = { link = 'Comment' },
    LeapMatch = {
      fg = colors.leap_primary_label,
      bold = true,
      nocombine = true,
    },
    LeapLabel = {
      fg = colors.leap_primary_label,
      bold = false,
      nocombine = true,
    },
  }
end

return M
