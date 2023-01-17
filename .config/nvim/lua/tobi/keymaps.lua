local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('n', '<C-l>', ':bnext<CR>', opts)
keymap('n', '<C-h>', ':bprevious<CR>', opts)
keymap('n', '<C-[>', ':bdelete<CR>', opts)

keymap('n', "<C-f>", ':NvimTreeFocus<CR>', opts)

keymap('n', '<C-S-f>', ':Telescope<CR>', opts)

