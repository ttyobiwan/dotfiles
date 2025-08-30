return {
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		opts = {
			options = {
				-- theme = 'monokai-pro',
				-- theme = 'nordic',
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = {
					{
						function()
							return ""
						end,
						padding = { left = 1, right = 0 },
						separator = "",
					},
					"mode",
				},
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'filetype' },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", padding = { left = 1 }, separator = "" },
					{
						function()
							return ""
						end,
						padding = { left = 1, right = 1 },
					},
				}

			}
		},
	},
}
