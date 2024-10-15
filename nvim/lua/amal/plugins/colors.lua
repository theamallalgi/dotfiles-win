--   ▄▄·       ▄▄▌        ▄▄▄
--  ▐█ ▌▪▪     ██•  ▪     ▀▄ █·
--  ██ ▄▄ ▄█▀▄ ██▪   ▄█▀▄ ▐▀▀▄
--  ▐███▌▐█▌.▐▌▐█▌▐▌▐█▌.▐▌▐█•█▌
--  ·▀▀▀  ▀█▄▀▪.▀▀▀  ▀█▄▀▪.▀  ▀
--  .▄▄ ·  ▄▄·  ▄ .▄▄▄▄ .• ▌ ▄ ·. ▄▄▄ .
--  ▐█ ▀. ▐█ ▌▪██▪▐█▀▄.▀··██ ▐███▪▀▄.▀·
--  ▄▀▀▀█▄██ ▄▄██▀▐█▐▀▀▪▄▐█ ▌▐▌▐█·▐▀▀▪▄
--  ▐█▄▪▐█▐███▌██▌▐▀▐█▄▄▌██ ██▌▐█▌▐█▄▄▌
--   ▀▀▀▀ ·▀▀▀ ▀▀▀ · ▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀

return {
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
			vim.api.nvim_set_hl(0, "Visual", { bg = "#21202b" }) -- selection background
			-- seperators
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#0f0f14", bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE", bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "NONE", bg = "NONE" })
		end,
	},
	-- {
	-- tokyonight (night) (moon/storm/night/day)
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- require("tokyonight").setup({})
	-- vim.cmd([[ colorscheme tokyonight-night ]])
	-- end,
	-- },
	-- {
	-- catppuccin theme (mocha) (latte/frappe/macchiato/mocha)
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- require("catppuccin").setup({})
	-- vim.cmd([[ colorscheme catppuccin-mocha ]])
	-- end,
	-- },
	-- {
	-- "Mofiqul/dracula.nvim",
	-- config = function()
	-- require("dracula").setup({
	-- show_end_of_buffer = false,
	-- lualine_bg_color = "#181818",
	-- colors = {
	-- bg = "#15141B",
	-- fg = "#FDFDFD",
	-- selection = "#232323",
	-- comment = "#3E3E3E",
	-- red = "#FF5555",
	-- orange = "#f97d26",
	-- yellow = "#f9a826",
	-- green = "#26f96b",
	-- purple = "#b267e6",
	-- cyan = "#26b7f9",
	-- pink = "#f92672",
	-- bright_red = "#ff2669",
	-- bright_green = "#26ff7b",
	-- bright_yellow = "#ffba26",
	-- bright_blue = "#26adff",
	-- bright_magenta = "#ce72ff",
	-- bright_cyan = "#26feff",
	-- bright_white = "#FFFFFD",
	-- menu = "#202020",
	-- visual = "#3E4452",
	-- gutter_fg = "#4B5263",
	-- nontext = "#3E3E3E",
	-- white = "#F8F8F2",
	-- black = "#181818",
	-- },
	-- })
	-- vim.cmd([[ colorscheme github-dark ]])
	-- end,
	-- },
}
