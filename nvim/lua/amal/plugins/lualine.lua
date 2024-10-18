local colors = {
	black = "#1a1b26",
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
	lightgray = "#433e62",
	inactivegray = "#3b4261",
}

local auraline = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.gray },
		c = { fg = colors.blue },
		x = { fg = colors.blue },
		y = { fg = colors.blue, bg = colors.gray },
		z = { fg = colors.black, bg = colors.blue },
	},

	insert = {
		a = { fg = colors.black, bg = colors.green },
		b = { fg = colors.green },
		c = { fg = colors.green },
		x = { fg = colors.green },
		y = { fg = colors.green },
		z = { fg = colors.black, bg = colors.green },
	},
	visual = {
		a = { fg = colors.black, bg = colors.orange },
		b = { fg = colors.orange },
		c = { fg = colors.orange },
		x = { fg = colors.orange },
		y = { fg = colors.orange },
		z = { fg = colors.black, bg = colors.orange },
	},
	replace = {
		a = { fg = colors.black, bg = colors.red },
		b = { fg = colors.red },
		c = { fg = colors.red },
		x = { fg = colors.red },
		y = { fg = colors.red },
		z = { fg = colors.black, bg = colors.red },
	},
	command = {
		a = { fg = colors.black, bg = colors.yellow },
		z = { fg = colors.black, bg = colors.yellow },
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
	config = function()
		require("lualine").setup({
			options = {
				theme = auraline,
				component_separators = "|",
				icons_enabled = false,
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "neo-tree", "alpha" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {},
			tabline = {},
			extension = {},
		})
	end,
}
