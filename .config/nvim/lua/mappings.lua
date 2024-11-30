require "nvchad.mappings"
local map = vim.keymap.set
---@type MappingsTable

-- M.general = {
--   n = {
--     [";"] = { ":", "enter command mode", opts = { nowait = true } },
-- 
--     --  format with conform
--     ["<leader>fm"] = {
--       function()
--         require("conform").format()
--       end,
--       "formatting",
--     },
--     ["<leader>db"] = {
--       "<cmd> DapToggleBreakPoint <CR>",
--       "Toggle breakpoint"
--     },
--     
-- 
--   },
--   v = {
--     [">"] = { ">gv", "indent"},
--   },
-- }

-- Debug (Dap)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" }) -- breakpoint
map("n", "<leader>dus",
function ()
  local widgets = require('dap.ui.widgets');
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open();
end, { desc = "Open debugging sidebar"}
) -- Debugging sidebar
map("n", "<leader>de", "<cmd>RustDebuggables<cr>", { desc = "Start debugging" }) -- Start debugging
map("n", "<leader>dn", "<cmd>DapStepOver<cr>", { desc = "Debug Step Over"})
map("n", "<leader>rcu", 
function ()
  require("crates").upgrade_all_crates()
end, { desc = "Update rust crates" })


-- return M
