return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- snacks.bigfile (faster when opening big files)
		bigfile = { enabled = true },
		-- snacks.notify (better notify)
		notify = {
			enabled = true,
							opts = {
					stages = "static",
					render = "minimal",
					title = function(item)
						return ""
					end,
				},
		},
		-- snacks.notifier (works best with notify)
		notifier = {
			enabled = true,
			timeout = 1000,
			render = "minimal",
		},
		styles = {
			notification = {
				wo = {
					cursorcolumn = false,
					cursorline = false,
					cursorlineopt = "both",
					colorcolumn = "",
					fillchars = "eob: ,lastline:…",
					list = false,
					listchars = "extends:…,tab:  ",
					number = false,
					relativenumber = false,
					signcolumn = "no",
					spell = false,
					winbar = "",
					statuscolumn = "",
					wrap = false,
					sidescrolloff = 0,
				},
			},
		},
		-- snacks.quickfile (makes opening empty files faster)
		quickfile = { enabled = true },
		-- snacks.lazygit (lazygit)
		lazygit = { enabled = true },
		-- snacks.rename (lsp rename)
		rename = { enabled = true },
		-- snacks.terminal (terminal toggle)
		terminal = { enabled = true, style = "popup" },
	},
	keys = {
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>nn",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
	},
}
