return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
				},
				no_italic = false,  -- Force no italic
				no_bold = false,    -- Force no bold
				no_underline = false, -- Force no underline
				default_integrations = true,
				integrations = {
					cmp = true,
					treesitter = true,
					telescope = { enabled = true, style = "nvchad" },
				}
			})
			vim.cmd.colorscheme "catppuccin"
		end
	},
	{
		'AlexvZyl/nordic.nvim',
		enabled = true,
		config = function()
			require('nordic').load()
		end
	}
}
