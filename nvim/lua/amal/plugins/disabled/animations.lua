return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "#d3cdc3",
			normal_bg = "#d3cdc3",
			smear_between_buffers = false,
			smear_between_neighbor_lines = true,
			use_floating_windows = true,
			legacy_computing_symbols_support = false,
			hide_target_hack = true,
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
}
