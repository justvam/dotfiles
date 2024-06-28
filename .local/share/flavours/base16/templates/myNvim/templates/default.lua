local M = {}

local function rgbToHex(r, g, b)
    -- Ensure values are within valid range (0-255)
    r = math.floor(math.min(255, math.max(0, r)))
    g = math.floor(math.min(255, math.max(0, g)))
    b = math.floor(math.min(255, math.max(0, b)))

    -- Convert to hexadecimal string format
    return string.format('#%02X%02X%02X', r, g, b)
end

M.base_30 = {
  white = "#D9E0EE",
  darker_black = rgbToHex(0,0,0),
  black = rgbToHex(0,0,0), --  nvim bg
  black2 = "#252434",
  one_bg = "#2d2c3c", -- real bg of onedark
  one_bg2 = "#363545",
  one_bg3 = "#3e3d4d",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#{{base08-hex}}",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#383747", -- for lines like vertsplit
  green = "#{{base0B-hex}}",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#{{base0D-hex}}",
  yellow = "#FAE3B0",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#F8BD96",
  cyan = "#89DCEB",
  statusline_bg = "#232232",
  lightbg = "#2f2e3e",
  pmenu_bg = "#ABE9B3",
  folder_bg = "#89B4FA",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#{{base00-hex}}",                   
  base01 = "#{{base01-hex}}",                   
  base02 = "#{{base02-hex}}",                   
  base03 = "#{{base03-hex}}",                   
  base04 = "#{{base04-hex}}",                   
  base05 = "#{{base05-hex}}",                   
  base06 = "#{{base06-hex}}",                   
  base07 = "#{{base07-hex}}",                   
  base08 = "#{{base08-hex}}",                   
  base09 = "#{{base09-hex}}",                   
  base0A = "#{{base0A-hex}}",                   
  base0B = "#{{base0B-hex}}",                   
  base0C = "#{{base0C-hex}}",                   
  base0D = "#{{base0D-hex}}",                   
  base0E = "#{{base0E-hex}}",                   
  base0F = "#{{base0F-hex}}"
}

M.polish_hl = {
  treesitter = {
    ["@variable"] = { fg = M.base_30.lavender },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.red },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin")

return M
