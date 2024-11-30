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
  white = "#e3dbd8",
  darker_black = rgbToHex(22*0.92,40*0.92,51*0.92), -- 6% darker than black
  black = "#162833", --  nvim bg
  black2 = rgbToHex(22*1.06,40*1.06,51*1.06),-- 6% lighter than black
  one_bg = rgbToHex(22*1.10,40*1.10,51*1.10), -- 10% lighter than black
  one_bg2 = rgbToHex(22*1.10*1.06,40*1.10*1.06,51*1.10*1.06), -- 6% lighter than one_bg2
  one_bg3 = rgbToHex(22*1.10*1.06*1.06,40*1.10*1.06*1.06,51*1.10*1.06*1.06), -- 6% lighter than one_bg3
  grey = rgbToHex(22*1.40,40*1.40,51*1.40), -- 40% lighter than black
  grey_fg = rgbToHex(22*1.40*1.10,40*1.40*1.10,51*1.40*1.10), -- 10% lighter than grey
  grey_fg2 = rgbToHex(22*1.40*1.05,40*1.40*1.05,51*1.40*1.05), -- 5% lighter than grey
  light_grey = "#605f6f",
  red = "#d44452",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = rgbToHex(22*1.15,40*1.15,51*1.15), -- for lines like vertsplit 15% ligher than black
  green = "#926d86",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#7f8375",
  yellow = "#48827f",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#bd5678",
  cyan = "#79777c",
  statusline_bg = rgbToHex(22*1.06,40*1.06,51*1.06),
  lightbg = rgbToHex(22*1.40*1.10,40*1.40*1.10,51*1.40*1.10),
  pmenu_bg = "#926d86",
  folder_bg = "#7f8375",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#162833",                   
  base01 = "#3d4950",                   
  base02 = "#636a6e",                   
  base03 = "#8a8b8c",                   
  base04 = "#b1acaa",                   
  base05 = "#d8ccc8",                   
  base06 = "#ded4d0",                   
  base07 = "#e3dbd8",                   
  base08 = "#d44452",                   
  base09 = "#bd5678",                   
  base0A = "#48827f",                   
  base0B = "#926d86",                   
  base0C = "#79777c",                   
  base0D = "#7f8375",                   
  base0E = "#427cb5",                   
  base0F = "#508087"
}

M.polish_hl = {
  defaults = {
    Comment = {
      fg = rgbToHex(22*1.40*1.80,40*1.40*1.80,51*1.40*1.80),
    },
  },

  treesitter = {
    ["@variable"] = { fg = M.base_30.lavender },
    ["@property"] = { fg = M.base_30.teal },
    ["@variable.builtin"] = { fg = M.base_30.red },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "flavours")

return M