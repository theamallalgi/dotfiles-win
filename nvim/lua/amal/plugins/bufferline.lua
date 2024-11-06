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
				bg = "#131218",
				fg = "#7153b2",
			},
			background = {
				fg = "#7153b2",
				bg = "#131218",
			},
			buffer_selected = {
				fg = "#a277ff",
				bg = "#15141b",
				bold = false,
				italic = false,
			},
			tab = {
				fg = "#7153b2",
				bg = "NONE",
			},
			tab_selected = {
				fg = "#a277ff",
				bg = "#15141b",
			},
			tab_separator = {
				fg = "#131218",
				bg = "NONE",
			},
			tab_separator_selected = {
				fg = "#131218",
				bg = "NONE",
			},
			tab_close = {
				fg = "#29263c",
				bg = "NONE",
			},
			close_button = {
				fg = "#29263c",
				bg = "NONE",
			},
			close_button_visible = {
				fg = "#29263c",
				bg = "NONE",
			},
			close_button_selected = {
				fg = "#a277ff",
				bg = "NONE",
			},
			modified_visible = {
				fg = "#ffca85",
				bg = "NONE",
			},
			modified_selected = {
				fg = "#ffca85",
				bg = "NONE",
			},
			separator = {
				fg = "#131218",
				bg = "NONE",
			},
		},
	},
}
