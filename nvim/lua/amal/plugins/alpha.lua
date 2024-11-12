return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"  ⠀ ████   ████       ⠀ ████   ████       ⠀ ████   ████    ",
			"  ███   ███   ███     ███   ███   ███ ⠀   ███   ███   ███  ",
			" ██  ███   ███  ██   ██  ███   ███  ██   ██  ███   ███  ██ ",
			" ⠀ ███⠀ ⠀ ⠀⠀ ███⠀⠀   ⠀ ███⠀ ⠀ ⠀⠀ ███⠀⠀⠀  ⠀ ███⠀ ⠀ ⠀⠀ ███⠀ ⠀",
			" ██  ███   ███  ██   ██  ███   ███  ██   ██  ███   ███  ██ ",
			"  ███   ███   ███     ███   ███   ███ ⠀   ███   ███   ███  ",
			"  ⠀ ████   ████       ⠀ ████   ████   ⠀   ⠀ ████   ████    ",
			"",
			"",
		}

		-- Define custom highlight groups
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#a277ff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#635e80", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "AlphaButtonShortcut", { fg = "#46425c", bg = "NONE", italic = false })

		-- Set menu with custom highlights
		dashboard.section.buttons.val = {
			dashboard.button("SPC n", "󰓎  → create new file", "<cmd>ene<CR>"),
			dashboard.button("SPC e", "󰓎  → toggle explorer", ":Neotree filesystem toggle<CR>"),
			dashboard.button("SPC r", "󰓎  → recent files", ":Telescope oldfiles<CR>"),
			-- dashboard.button("SPC f", "󰓎  → find a file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC l", "󰓎  → lazy plugins", "<cmd>Lazy<CR>"),
			dashboard.button("q", "󰓎  → quit neovim", "<cmd>qa<CR>"),
		}

		-- Layout configuration to center everything vertically
		dashboard.config.layout = {
			{ type = "padding", val = math.floor(vim.fn.winheight(0) * 0.2) }, -- Adjust top padding to vertically center
			dashboard.section.header,
			{ type = "padding", val = 2 }, -- Space between header and buttons
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		-- Apply highlight groups to buttons
		dashboard.section.header.opts.hl = "AlphaHeader"
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtonText" -- Text highlight
			button.opts.hl_shortcut = "AlphaButtonShortcut" -- Shortcut highlight
		end

		-- Set footer
		dashboard.section.footer.val = { " on days like these kids like you should be playing nintendo games " }
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#2f234b", bg = "NONE", italic = false })
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}

-- dashboard.section.header.val = {
-- '           ▄ ▄                   ',
-- '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
-- '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
-- '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
-- '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
-- '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
-- '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
-- '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
-- '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
-- }

-- dashboard.section.header.val = {
-- ⠀⠀⠀⠀⠀⠀⢠⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⣤⠀⠀⠀⠀⠀⠀⢠⣤⣤⡄⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⣰⣿⣿⣿⣥⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡀⠀⢠⣤⣤⣤⣤⣿⣿⣿⣤⣤⣤⣤⡄⠀⣼⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⣠⣾⣿⣿⣿⡿⠿⣿⣿⡿⠿⣿⣿⣿⠿⣿⣿⣿⡿⠿⠇⠀⠸⠿⢿⣿⣿⠿⠿⠿⣿⣿⣿⠿⠇⢠⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀
-- ⠀⠀⠙⢿⣿⢿⣿⣿⡆⠀⣿⣿⡇⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⠀⠀⠀⣤⣬⣿⣿⣦⣤⣤⣿⣿⣧⣤⡀⣼⣿⣿⡿⠿⢿⣿⣿⡿⠇⠀⠀
-- ⠀⠀⢠⣤⣤⣼⣿⣿⣦⣤⣿⣿⣧⣤⣿⣿⣷⣤⣼⣿⣿⣤⣤⣤⠀⠀⣿⣿⡿⠿⢿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿⡆⠀⢸⣿⣿⠃⠀⠀⠀
-- ⠀⠀⠸⠿⠿⢿⣿⣿⡿⠿⣿⣿⡿⠿⣿⣿⡿⠿⢿⣿⣿⠿⠿⠿⠀⠀⣿⣿⢀⣤⣼⣿⣧⣤⡀⣿⣿⣿⣿⢿⣿⣧⠀⣾⣿⡿⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⣿⣿⡇⠀⣿⣿⡇⠀⢸⣿⣿⠀⠀⠀⠀⠀⣿⣿⠘⠛⢻⣿⡟⠛⠃⣿⣿⡏⠁⠘⣿⣿⣦⣿⣿⠇⠀⠀⠀⠀
-- ⠀⠀⠀⣶⣶⣾⣿⣿⣷⣶⣿⣿⣷⣶⣿⣿⣷⣶⣾⣿⣿⣶⣶⣶⠀⠀⣿⣿⠀⣶⣾⣿⣷⣶⠀⣿⣿⡇⠀⠀⢹⣿⣿⣿⡿⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠛⠛⣛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⢛⣛⠛⠛⠀⠀⣿⣿⠀⣿⣏⣉⣹⣿⠀⣿⣿⡇⠀⠀⢀⣿⣿⣿⡅⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⣼⣿⣿⠇⠀⢰⣿⣿⡀⠀⢲⣿⣿⡄⠀⠻⣿⣿⣧⡀⠀⠀⣿⣿⠀⣿⡿⠿⠿⠿⠀⣿⣿⡇⢀⣴⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀
-- ⠀⠀⢀⣼⣿⣿⠏⠀⠀⢸⣿⣿⡇⠀⠈⣿⣿⣷⠀⠀⠹⣿⣿⣷⡀⠀⣿⣿⠀⠉⠁⠀⠠⣤⣤⣿⣿⣷⣿⣿⡿⠋⠀⠙⢿⣿⣿⠦⠀⠀
-- ⠀⠀⠈⠉⠛⠋⠀⠀⠀⠈⠛⠉⠁⠀⠀⠙⠋⠉⠀⠀⠀⠘⠛⠉⠁⠀⠛⠛⠀⠀⠀⠀⠀⠛⠛⠛⠋⠀⠛⠉⠀⠀⠀⠀⠀⠙⠋⠀⠀⠀
-- }

-- dashboard.section.header.val = {
-- "  ⠀ ████   ████       ⠀ ████   ████       ⠀ ████   ████    ",
-- "  ███   ███   ███     ███   ███   ███ ⠀   ███   ███   ███  ",
-- " ██  ███   ███  ██   ██  ███   ███  ██   ██  ███   ███  ██ ",
-- " ⠀ ███⠀ ⠀ ⠀⠀ ███⠀⠀   ⠀ ███⠀ ⠀ ⠀⠀ ███⠀⠀⠀  ⠀ ███⠀ ⠀ ⠀⠀ ███⠀ ⠀",
-- " ██  ███   ███  ██   ██  ███   ███  ██   ██  ███   ███  ██ ",
-- "  ███   ███   ███     ███   ███   ███ ⠀   ███   ███   ███  ",
-- "  ⠀ ████   ████       ⠀ ████   ████   ⠀   ⠀ ████   ████    ",
-- "",
-- "",
-- }
