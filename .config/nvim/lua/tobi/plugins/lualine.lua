return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						function()
							return ""
						end,
						padding = { left = 1, right = 0 },
						separator = "",
					},
					"mode",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = "" },
					{
						function()
							return ""
						end,
						padding = { left = 0, right = 1 },
					},
				}

			}
		}
	},
}
