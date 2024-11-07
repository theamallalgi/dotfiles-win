local colors = {
	black = "#1a1b26",
	darkblack = "#131218",
	white = "#edecee",
	red = "#ff6767",
	green = "#61ffca",
	blue = "#a277ff",
	magenta = "#a277ff",
	cyan = "#61ffca",
	yellow = "#ffca85",
	orange = "#ff7b7b",
	gray = "#29263c",
	darkgray = "#15141b",
	lightgray = "#7153b2", -- 433e62
	inactivegray = "#3b4261",
}

local auraline = {
	normal = {
		a = { fg = colors.blue, bg = colors.black },
		b = { fg = colors.lightgray, bg = colors.darkblack },
		c = { fg = colors.lightgray, bg = colors.darkblack },
		x = { fg = colors.lightgray, bg = colors.darkblack },
		y = { fg = colors.lightgray, bg = colors.darkblack },
		z = { fg = colors.lightgray, bg = colors.darkblack },
	},
	insert = {
		a = { fg = colors.green, bg = "#123127" },
		z = { fg = colors.lightgray, bg = colors.darkblack },
	},
	visual = {
		a = { fg = colors.yellow, bg = "#4b3b27" },
		z = { fg = colors.lightgray, bg = colors.darkblack },
	},
	replace = {
		a = { fg = colors.red, bg = "#652929" },
		z = { fg = colors.lightgray, bg = colors.darkblack },
	},
	command = {
		a = { fg = colors.orange, bg = "#4b2424" },
		z = { fg = colors.lightgray, bg = colors.darkblack },
	},
	inactive = {
		a = { fg = colors.inactivegray, bg = colors.magenta },
		b = { fg = colors.inactivegray, bg = colors.magenta },
		c = { fg = colors.inactivegray },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazyload = true,
	dependencies = {
		"meuter/lualine-so-fancy.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = auraline,
				globalstatus = true,
				component_separators = { left = "|", right = "|" },
				-- icons_enabled = false,
				section_separators = { left = "", right = "" }, -- { left = "", right = "" }
				disabled_filetypes = { "alpha" },
				fmt = string.lower,
			},
			sections = {
				lualine_a = { { "fancy_mode", width = 3 } },
				lualine_b = { "fancy_branch", { "filename", path = 0, symbols = { modified = "󰫢" } } },
				lualine_c = {},
				lualine_x = {}, -- filetype
				lualine_y = {},
				lualine_z = { "location", "progress" },
			},
			inactive_sections = {},
			tabline = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
