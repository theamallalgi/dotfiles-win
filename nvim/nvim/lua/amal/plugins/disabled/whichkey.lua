return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = require("mappings").which_key,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		layout = {
			height = { min = 4, max = 40 }, -- min and max height of the columns
		},
	},
}
