return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",  -- latte, frappe, macchiato, mocha
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
				},
				no_italic = false,  -- Force no italic
				no_bold = false,    -- Force no bold
				no_underline = false, -- Force no underline
				styles = {          -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
				},
				default_integrations = true,
				integrations = {
					treesitter = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
				},
			})
			vim.cmd.colorscheme "catppuccin"
		end
	}
}
