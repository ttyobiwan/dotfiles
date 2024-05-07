return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			icons_enabled = true,
			component_separators = { left = "", right = "│" },
			section_separators = { left = "", right = "" },
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { { "fancy_mode", width = 8 } },
			lualine_b = {
				"fancy_branch",
			},
			lualine_c = {
				{
					"filename",
					path = 0,
				},
				{ "fancy_diagnostics", sources = { "nvim_lsp" } },
				{ "fancy_searchcount" },
			},
			lualine_x = {
				{ "fancy_filetype", ts_icon = "󰍳" },
				"fancy_lsp_servers",
				"fancy_diff",
				"progress",
			},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { "neo-tree", "lazy" },
	}
}
