return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
			always_show_bufferline = false,
			indicator = { style = "none" },
			seperator_style = "slant",
			offsets = {
				{
					filetype = "neo-tree",
					text = "  Explorer",
					text_align = "left",
					separator = false,
				},
			},
		},
		highlights = {
			fill = {
				ctermbg = "#15141b",
				bg = "#0f0f14",
			},
		},
	},
}
