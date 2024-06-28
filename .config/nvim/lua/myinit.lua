-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--


local vim = vim
local opt = vim.opt

opt.foldmethod = "syntax"
opt.foldexpr = "nvim_treesitter#foldexpr()"

