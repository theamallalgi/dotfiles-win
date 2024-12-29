return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- snacks.bigfile (faster when opening big files)
		bigfile = { enabled = true },
		-- snacks.notify (better notify)
		notify = { enabled = true },
		-- snacks.notifier (works best with notify)
		notifier = {
			enabled = true,
			timeout = 1000,
		},
		styles = {
			notification = {
				wo = { wrap = false },
			},
		},
		-- snacks.quickfile (makes opening empty files faster)
		quickfile = { enabled = true },
		-- snacks.lazygit (lazygit)
		lazygit = { enabled = true },
		-- snacks.rename (lsp rename)
		rename = { enabled = true },
		-- snacks.terminal (terminal toggle)
		terminal = { enabled = true },
	},
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
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
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
