return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
	opts = {},
	config = function()
		require("ibl").setup {
			scope = { enabled = false },
		}
	end
}
