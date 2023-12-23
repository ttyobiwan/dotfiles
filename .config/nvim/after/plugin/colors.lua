require('rose-pine').setup({
    disable_background = true,
    disable_italics = true,
    variant = "moon"
})

-- require('kanagawa').setup({
--     commentStyle = { italic = true },
--     keywordStyle = { italic = true},
--     statementStyle = { bold = false },
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })

vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("kanagawa")

