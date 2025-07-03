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
					text = "filesystem",
					text_align = "left",
					separator = false,
					highlight = "Function",
				},
			},
			buffer_close_icon = "󰅖",
			modified_icon = "󰫢 ",
			close_icon = "󰅖 ",
			left_trunc_marker = "󰁍 ",
			right_trunc_marker = "󰁔 ",
			color_icons = false,
			show_buffer_icons = false,
		},
		highlights = {
			fill = {
				bg = "#0b080e",
				fg = "#542a91",
			},
			background = {
				fg = "#542a91",
				bg = "#0b080e",
			},
			buffer_selected = {
				fg = "#8443e3",
				bg = "#0d0910",
				bold = false,
				italic = false,
			},
			tab = {
				fg = "#542a91",
				bg = "NONE",
			},
			tab_selected = {
				fg = "#8443e3",
				bg = "#0d0910",
			},
			tab_separator = {
				fg = "#0b080e",
				bg = "NONE",
			},
			tab_separator_selected = {
				fg = "#0b080e",
				bg = "NONE",
			},
			tab_close = {
				fg = "#191226",
				bg = "NONE",
			},
			close_button = {
				fg = "#191226",
				bg = "NONE",
			},
			close_button_visible = {
				fg = "#191226",
				bg = "NONE",
			},
			close_button_selected = {
				fg = "#8443e3",
				bg = "NONE",
			},
			modified_visible = {
				fg = "#e49068",
				bg = "NONE",
			},
			modified_selected = {
				fg = "#e49068",
				bg = "NONE",
			},
			separator = {
				fg = "#0b080e",
				bg = "NONE",
			},
		},
	},
}
