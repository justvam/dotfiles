---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "flavours",
  theme_toggle = { "flavours", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
M.mappings = require "mappings"

return M
