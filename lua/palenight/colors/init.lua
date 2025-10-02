local hsluv = require 'palenight.hsluv'

--- Blend two hex colors with a given alpha
--- @param bg string Hex color of the background (e.g., '#RRGGBB')
--- @param fg string Hex color to blend on top of the background (e.g., '#RRGGBB')
--- @param alpha number Alpha value between 0 (fully bg) and 1 (fully fg)
local function blend(bg, fg, alpha)
  local bg_rgb = hsluv.hex_to_rgb(bg)
  local fg_rgb = hsluv.hex_to_rgb(fg)

  local blended_rgb = {
    bg_rgb[1] * (1 - alpha) + fg_rgb[1] * alpha,
    bg_rgb[2] * (1 - alpha) + fg_rgb[2] * alpha,
    bg_rgb[3] * (1 - alpha) + fg_rgb[3] * alpha,
  }

  return hsluv.rgb_to_hex(blended_rgb)
end

local colors = {
  dark_red = '#FF0A33',
  dark_green = '#A6DC56',
  dark_yellow = '#FFB01F',
  dark_blue = '#5C9AFF',
  dark_purple = '#C74BD2',
  dark_cyan = '#47CBFF',

  red = '#ff5370',
  green = '#C3E88D',
  yellow = '#ffcb6b',
  blue = '#8cb8ff',
  purple = '#d67cde',
  cyan = '#96e1ff',

  light_red = '#FF99AA',
  light_green = '#E5F5CC',
  light_yellow = '#FFDB99',
  light_blue = '#ADCDFF',
  light_purple = '#E09DE7',
  light_cyan = '#ADE8FF',

  blue_purple = '#8a87de',

  -- highlight DiffAdd gui=bold guifg=none guibg=#2e4b2e
  -- highlight DiffDelete gui=bold guifg=none guibg=#4c1e15
  -- highlight DiffChange gui=bold guifg=none guibg=#45565c
  -- highlight DiffText gui=bold guifg=none guibg=#996d74-

  -- dark_green  = '#A6E22E',
  -- dark_yellow = '#F78C6C',
  -- light_red  '#ff869a',
  -- dark_rrd = '#BE5046',

  white = '#cccce6',
  black = '#1c1d24',

  visual_black = nil,
  comment_grey = '#697098',
  gutter_fg_grey = '#4B5263',
  cursor_grey = '#273540',
  visual_grey = '#3E4452',
  menu_grey = '#3E4452',
  special_grey = '#3B4048',
  vertsplit = '#181A1F',
  white_mask_1 = '#333747',
  white_mask_3 = '#474b59',
  white_mask_11 = '#989aa2',
  leap_primary_label = '#ff2f87',
  leap_secondary_label = '#ff2f87',
}

local function bg_blend(fg, alpha)
  return blend(colors.black, fg, alpha)
end

colors.bg_red = bg_blend(colors.dark_red, 0.20)
colors.bg_green = bg_blend(colors.dark_green, 0.20)
colors.bg_yellow = bg_blend(colors.yellow, 0.20)
colors.bg_blue = bg_blend(colors.dark_blue, 0.20)
colors.bg_purple = bg_blend(colors.dark_purple, 0.20)
colors.bg_cyan = bg_blend(colors.dark_cyan, 0.20)

return colors
