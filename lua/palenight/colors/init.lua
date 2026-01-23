local hsl = require('palenight.hsl').hsl
local rgb_to_hsl = require('palenight.hsl').rgb_to_hsl
local hsl_to_rgb = require('palenight.hsl').hsl_to_rgb

--- Transform an HSL color to RGB.
---

--- Blend two hex colors with a given alpha
--- @param bg HSLColor Hex color of the background (e.g., '#RRGGBB')
--- @param fg HSLColor Hex color to blend on top of the background (e.g., '#RRGGBB')
--- @param alpha number Alpha value between 0 (fully bg) and 1 (fully fg)
--- @return HSLColor Hex color result of the blend (e.g., '#RRGGBB')
local function blend(bg, fg, alpha)
  local bg_rgb = hsl_to_rgb(bg)
  local fg_rgb = hsl_to_rgb(fg)

  local blended_rgb = {
    bg_rgb.r * (1 - alpha) + fg_rgb.r * alpha,
    bg_rgb.g * (1 - alpha) + fg_rgb.g * alpha,
    bg_rgb.b * (1 - alpha) + fg_rgb.b * alpha,
  }

  return rgb_to_hsl {
    r = math.floor(blended_rgb[1] + 0.5),
    g = math.floor(blended_rgb[2] + 0.5),
    b = math.floor(blended_rgb[3] + 0.5),
  }
end

local red = hsl(350, 80, 65)
local orange = hsl(39, 80, 65)
local yellow = hsl(65, 80, 65)
local green = hsl(120, 80, 65)
local cyan = hsl(180, 80, 65)
local blue = hsl(220, 80, 65)
local purple = hsl(300, 80, 65)
local blue_purple = blue:mix(purple, 50)

local white = blue:lightness(80):saturation(30)
local black = blue:lightness(11):saturation(17)

local full_white = hsl(0, 0, 100)
local full_black = hsl(0, 0, 0)

local dark_red = red:darken(30)
local dark_green = green:darken(30)
local dark_yellow = yellow:darken(30)
local dark_orange = orange:darken(30)
local dark_blue = blue:darken(30)
local dark_purple = purple:darken(30)
local dark_cyan = cyan:darken(30)

local light_red = red:lighten(30):saturation(100)
local light_green = green:lighten(30):saturation(100)
local light_yellow = yellow:lighten(30):saturation(100)
local light_orange = orange:lighten(30):saturation(100)
local light_blue = blue:lighten(30):saturation(100)
local light_purple = purple:lighten(30):saturation(100)
local light_cyan = cyan:lighten(30):saturation(100)

local comment_grey = black:lighten(43):saturation(10)
local inlay_hint = black:lighten(30)

local grey = black:lighten(20)

local gutter_fg_grey = grey
local cursor_grey = black:lighten(10)

local visual_grey = grey
local menu_grey = grey
local special_grey = grey
local vertsplit = grey

local leap_primary_label = hsl(335, 100, 59)
local leap_secondary_label = leap_primary_label:rotate(220)

local background = black

local background_red = blend(background, red, 0.50):saturation(50)
local background_green = blend(background, green, 0.50):saturation(50)
local background_yellow = blend(background, yellow, 0.50):saturation(80)
local background_orange = blend(background, orange, 0.20):saturation(100)
local background_blue = blend(background, light_blue, 0.20):saturation(80)
local background_purple = blend(background, purple, 0.50):saturation(50)
local background_cyan = blend(background, cyan, 0.50):saturation(50)

--- @class PalenightColors
--- @field red string
--- @field orange string
--- @field yellow string
--- @field green string
--- @field cyan string
--- @field blue string
--- @field purple string
--- @field blue_purple string
--- @field white string
--- @field black string
--- @field full_white string
--- @field full_black string
--- @field dark_red string
--- @field dark_green string
--- @field dark_yellow string
--- @field dark_orange string
--- @field dark_blue string
--- @field dark_purple string
--- @field dark_cyan string
--- @field light_red string
--- @field light_green string
--- @field light_yellow string
--- @field light_orange string
--- @field light_blue string
--- @field light_purple string
--- @field light_cyan string
--- @field comment_grey string
--- @field inlay_hint string
--- @field grey string
--- @field gutter_fg_grey string
--- @field cursor_grey string
--- @field visual_grey string
--- @field menu_grey string
--- @field special_grey string
--- @field vertsplit string
--- @field leap_primary_label string
--- @field leap_secondary_label string
--- @field background string
--- @field background_red string
--- @field background_green string
--- @field background_yellow string
--- @field background_orange string
--- @field background_blue string
--- @field background_purple string
--- @field background_cyan string

--- @type PalenightColors
local colors = {
  red = red.hex,
  orange = orange.hex,
  yellow = yellow.hex,
  green = green.hex,
  cyan = cyan.hex,
  blue = blue.hex,
  purple = purple.hex,
  blue_purple = blue_purple.hex,
  white = white.hex,
  black = black.hex,
  full_white = full_white.hex,
  full_black = full_black.hex,
  dark_red = dark_red.hex,
  dark_green = dark_green.hex,
  dark_yellow = dark_yellow.hex,
  dark_orange = dark_orange.hex,
  dark_blue = dark_blue.hex,
  dark_purple = dark_purple.hex,
  dark_cyan = dark_cyan.hex,
  light_red = light_red.hex,
  light_green = light_green.hex,
  light_yellow = light_yellow.hex,
  light_orange = light_orange.hex,
  light_blue = light_blue.hex,
  light_purple = light_purple.hex,
  light_cyan = light_cyan.hex,
  comment_grey = comment_grey.hex,
  inlay_hint = inlay_hint.hex,
  grey = grey.hex,
  gutter_fg_grey = gutter_fg_grey.hex,
  cursor_grey = cursor_grey.hex,
  visual_grey = visual_grey.hex,
  menu_grey = menu_grey.hex,
  special_grey = special_grey.hex,
  vertsplit = vertsplit.hex,
  leap_primary_label = leap_primary_label.hex,
  leap_secondary_label = leap_secondary_label.hex,
  background = background.hex,
  background_red = background_red.hex,
  background_green = background_green.hex,
  background_yellow = background_yellow.hex,
  background_orange = background_orange.hex,
  background_blue = background_blue.hex,
  background_purple = background_purple.hex,
  background_cyan = background_cyan.hex,
}

-- local function bg_blend(fg, alpha)
--   return blend(black, fg, alpha)
-- end
--
-- colors.background_red = bg_blend(colors.dark_red, 0.20).hex
-- colors.background_green = bg_blend(colors.dark_green, 0.20).hex
-- colors.background_yellow = bg_blend(colors.yellow, 0.20).hex
-- colors.background_blue = bg_blend(colors.dark_blue, 0.20).hex
-- colors.background_purple = bg_blend(colors.dark_purple, 0.20).hex
-- colors.background_cyan = bg_blend(colors.dark_cyan, 0.20).hex

return colors
