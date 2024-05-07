return {
	"folke/zen-mode.nvim",
	config = function()
		local zm = require("zen-mode")
		vim.keymap.set("n", "<leader>zz", function()
			zm.setup {
				window = {
					width = 255,
				},
			}
			zm.toggle()
		end)
	end
}
