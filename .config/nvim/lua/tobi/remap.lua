vim.wo.relativenumber = true

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

-- TODO: Move this
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")

local zm = require("zen-mode")
vim.keymap.set("n", "<leader>zz", function()
    zm.setup {
        window = {
            width = 120,
            options = { }
        },
    }
    zm.toggle()
end)

