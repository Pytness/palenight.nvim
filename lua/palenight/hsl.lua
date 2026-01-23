--- @class HSL
--- @field h number Hue (0-1)
--- @field s number Saturation (0-1)
--- @field l number Lightness (0-1)

--- @class RGB
--- @field r number Red (0-255)
--- @field g number Green (0-255)
--- @field b number Blue (0-255)

--- @class HSLColor
--- @field h number Hue (0-360)
--- @field s number Saturation (0-100)
--- @field l number Lightness (0-100)
--- @field hex string Hex representation (e.g., '#RRGGBB')
--- @field to_rgb fun(self): RGB
--- @field to_hex fun(self): string
--- @field rotate fun(self, degrees: number): HSLColor
--- @field lighten fun(self, amount: number): HSLColor
--- @field darken fun(self, amount: number): HSLColor
--- @field saturate fun(self, amount: number): HSLColor
--- @field desaturate fun(self, amount: number): HSLColor
--- @field lightness fun(self, value: number): HSLColor
--- @field saturation fun(self, value: number): HSLColor
--- @field mix fun(self, other: HSLColor, weight: number): HSLColor

--- @param num number
local function round(num)
  return math.floor(num + 0.5)
end

local function hue2rgb(p, q, t)
  if t < 0 then
    t = t + 1
  end
  if t > 1 then
    t = t - 1
  end
  if t < 1 / 6 then
    return p + (q - p) * 6 * t
  end
  if t < 1 / 2 then
    return q
  end
  if t < 2 / 3 then
    return p + (q - p) * (2 / 3 - t) * 6
  end
  return p
end

local function hsl_to_rgb(hsl)
  local h = (hsl.h % 360) / 360
  local s = math.min(math.max(hsl.s / 100, 0), 1)
  local l = math.min(math.max(hsl.l / 100, 0), 1)

  local r = l
  local g = l
  local b = l

  if s ~= 0 then
    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return {
    r = round(r * 255),
    g = round(g * 255),
    b = round(b * 255),
  }
end

--- @param rgb RGB
--- @return HSLColor
local function rgb_to_hsl(rgb)
  local r = rgb.r / 255
  local g = rgb.g / 255
  local b = rgb.b / 255

  local max, min = math.max(r, g, b), math.min(r, g, b)

  local h = 0
  local s = 0
  local l = (max + min) / 2

  local achromatic = max == min

  if not achromatic then
    local d = max - min
    if l > 0.5 then
      s = d / (2 - max - min)
    else
      s = d / (max + min)
    end
    if max == r then
      h = (g - b) / d
      if g < b then
        h = h + 6
      end
    elseif max == g then
      h = (b - r) / d + 2
    elseif max == b then
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return {
    h = round(h * 360),
    s = round(s * 100),
    l = round(l * 100),
  }
end

--- @param hex string
--- @return RGB
local function hex_to_rgb(hex)
  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  return { r = r, g = g, b = b }
end

--- @param rgb RGB
--- @return string
local function rgb_to_hex(rgb)
  return string.format('#%02x%02x%02x', rgb.r, rgb.g, rgb.b)
end

local function hex_to_hsl(hex)
  local rgb = hex_to_rgb(hex)
  return rgb_to_hsl(rgb)
end

local function hsl_to_hex(hsl)
  local rgb = hsl_to_rgb(hsl)
  return rgb_to_hex(rgb)
end

--- @param h number
--- @param s number
--- @param l number
--- @return HSLColor
local function hsl(h, s, l)
  h = math.min(math.max(h, 0), 360)
  s = math.min(math.max(s, 0), 100)
  l = math.min(math.max(l, 0), 100)

  local color = {
    h = h,
    s = s,
    l = l,
  }

  color.hex = hsl_to_hex(color)

  function color:to_rgb()
    return hsl_to_rgb(self)
  end

  function color:to_hex()
    return hsl_to_hex(self)
  end

  --- @param degrees number
  function color:rotate(degrees)
    local hue = (self.h + degrees) % 360
    return hsl(hue, self.s, self.l)
  end

  local function lerp(value, percent)
    local min = 0
    local max = 100

    local lerp_space = percent < min and value or (max - value)
    return value + (lerp_space * (percent / 100))
  end

  --- @param amount number
  function color:lighten(amount)
    local _l = lerp(self.l, amount)
    return hsl(self.h, self.s, _l)
  end

  --- @param amount number
  function color:darken(amount)
    local _l = lerp(self.l, -amount)
    return hsl(self.h, self.s, _l)
  end

  --- @param amount number
  function color:saturate(amount)
    local _s = lerp(self.s, amount)
    return hsl(self.h, _s, self.l)
  end

  --- @param amount number
  function color:desaturate(amount)
    local _s = lerp(self.s, -amount)
    return hsl(self.h, _s, self.l)
  end

  --- @param value number
  function color:lightness(value)
    return hsl(self.h, self.s, value)
  end

  --- @param value number
  function color:saturation(value)
    return hsl(self.h, value, self.l)
  end

  --- @param other HSLColor
  --- @param weight number Percentage of self in the mix (0-100)
  function color:mix(other, weight)
    local w = weight / 100
    local _h = self.h * w + other.h * (1 - w)
    local _s = self.s * w + other.s * (1 - w)
    local _l = self.l * w + other.l * (1 - w)

    return hsl(_h, _s, _l)
  end

  return color
end

return {
  hsl = hsl,
  hex_to_hsl = function(hex)
    local _hsl = hex_to_hsl(hex)
    return hsl(_hsl.h, _hsl.s, _hsl.l)
  end,
  rgb_to_hsl = function(rgb)
    local _hsl = rgb_to_hsl(rgb)
    return hsl(_hsl.h, _hsl.s, _hsl.l)
  end,
  hsl_to_rgb = hsl_to_rgb,
}
