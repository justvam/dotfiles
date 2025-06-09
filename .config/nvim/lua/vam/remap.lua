vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open File Explorer' })

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- harpoon --
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = 'Harpoon add buffer' })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = 'Harpoon select 1' })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = 'Harpoon select 2' })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = 'Harpoon select 3' })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = 'Harpoon select 4' })


-- undotree -- 
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Open undotree' })


-- fugitive --
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = 'Open git (fugitive)'})

if true then
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

