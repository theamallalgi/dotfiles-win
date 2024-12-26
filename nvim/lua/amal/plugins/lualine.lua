local colors = {
	black = "#100d17", -- 1a1b26 (night)
	darkblack = "#0b080e", -- 131218 (night)
	white = "#d0b6d0", -- edecee (night)
	red = "#e4374b", -- ff6767 (night)
	green = "#46cea9", -- 61ffca (night)
	blue = "#8443e3", -- a277ff  (night)
	magenta = "#8443e3", -- a277ff (night)
	cyan = "#46cea9", -- 61ffca (night)
	yellow = "#e49068", -- ffca85 (night)
	orange = "#e4465e", -- ff7b7b (night)
	gray = "#191226", -- 29263c (night)
	darkgray = "#0d0910", -- 15141b (night)
	lightgray = "#542a91", -- 7153b2 (night)
	inactivegray = "#272045", -- 3b4261 (night)
}

local zitchdog = {
	normal = {
		a = { fg = colors.blue, bg = colors.black },
		b = { fg = colors.lightgray, bg = colors.darkblack },
		c = { fg = colors.lightgray, bg = colors.darkblack },
		x = { fg = colors.lightgray, bg = colors.darkblack },
		y = { fg = colors.lightgray, bg = colors.darkblack },
		z = { fg = colors.green, bg = "#123127" },
	},
	insert = {
		a = { fg = colors.green, bg = "#123127" },
		z = { fg = colors.green, bg = "#123127" },
		y = { fg = colors.lightgray, bg = colors.darkblack },
	},
	visual = {
		a = { fg = colors.yellow, bg = "#4b3b27" },
		z = { fg = colors.yellow, bg = "#4b3b27" },
		y = { fg = colors.lightgray, bg = colors.darkblack },
	},
	replace = {
		a = { fg = colors.red, bg = "#652929" },
		z = { fg = colors.red, bg = "#652929" },
		y = { fg = colors.lightgray, bg = colors.darkblack },
	},
	command = {
		a = { fg = colors.orange, bg = "#4b2424" },
		z = { fg = colors.orange, bg = "#4b2424" },
		y = { fg = colors.lightgray, bg = colors.darkblack },
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
				theme = zitchdog,
				globalstatus = true,
				component_separators = { left = "|", right = "|" },
				-- icons_enabled = false,
				section_separators = { left = "", right = "" }, -- { left = "", right = "" }
				disabled_filetypes = { "alpha" },
				fmt = string.lower,
			},
			sections = {
				lualine_a = { { "fancy_mode", width = 3 } },
				lualine_b = {},
				lualine_c = {
					"fancy_branch",
					{ "filename", path = 0, symbols = { modified = "󰫢" } },
				},
				lualine_x = {},
				lualine_y = { "location", "progress" },
				lualine_z = {
					function()
						return _G.copilot_enabled and "" or ""
					end,
				},
			},
			inactive_sections = {},
			tabline = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
