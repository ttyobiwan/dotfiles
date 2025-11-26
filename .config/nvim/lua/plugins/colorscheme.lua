return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				default_integrations = true,
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
				variant = "moon",
			})
			vim.cmd("colorscheme rose-pine")
		end
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end
	}
}
