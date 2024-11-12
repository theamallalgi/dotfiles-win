return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-t>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			persist_size = false,
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 0,
			},
		})
	end,
}
