return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				default_integrations = true,
				no_italic = true,
				no_bold = true,
			})
			vim.cmd([[colorscheme catppuccin]])
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = false,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- main, moon, dawn
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd("colorscheme rose-pine")
		end
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- night, storm, day, moon
			})
			vim.cmd [[colorscheme tokyonight]]
		end

	},
	{
		"loctvl842/monokai-pro.nvim",
		enabled = false,
		config = function()
			require("monokai-pro").setup()
			-- "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
			vim.cmd [[colorscheme monokai-pro-octagon]]
		end
	},
	{
		"navarasu/onedark.nvim",
		enabled = true,
		config = function()
			require('onedark').setup {
				style = 'cool' -- dark, darker, cool, deep, warm, warmer
			}
			require('onedark').load()
		end
	}
}
