return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- set header
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

		-- set menu with custom highlights
		dashboard.section.buttons.val = {
			dashboard.button("SPC n", "󰓎  → create new file", "<cmd>ene<CR>"),
			dashboard.button("SPC e", "󰓎  → toggle explorer", ":Neotree filesystem toggle<CR>"),
			dashboard.button("SPC r", "󰓎  → recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("SPC l", "󰓎  → lazy plugins", "<cmd>Lazy<CR>"),
			dashboard.button("q", "󰓎  → quit neovim", "<cmd>qa<CR>"),
		}

		-- layout configuration to center everything vertically
		dashboard.config.layout = {
			{ type = "padding", val = math.floor(vim.fn.winheight(0) * 0.2) }, -- Adjust top padding to vertically center
			dashboard.section.header,
			{ type = "padding", val = 2 }, -- Space between header and buttons
			dashboard.section.buttons,
			dashboard.section.footer,
		}

		-- apply highlight groups to buttons
		dashboard.section.header.opts.hl = "AlphaHeader"
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtonText" -- text highlight
			button.opts.hl_shortcut = "AlphaButtonShortcut" -- shortcut highlight
		end

		-- footer configuration
		local function get_random_quote() -- function to read and load the quotes from the JSON file
			local file_path = "C:/Users/amall/AppData/Local/nvim/lua/amal/plugins/config/quotes.json" -- update with your actual path
			local file = io.open(file_path, "r")
			if not file then
				return "[ on days like these kids like you should be playing nintendo games. ]"
			end
			local content = file:read("*all")
			file:close()
			local quotes = vim.fn.json_decode(content).quotes
			math.randomseed(os.time())
			local random_index = math.random(1, #quotes)
			return quotes[random_index]
		end

		dashboard.section.footer.val = {
			"",
			"",
			"",
			get_random_quote(), -- update the footer section with the random quote
		}

		dashboard.section.footer.opts.hl = "AlphaFooter" -- set footer

		alpha.setup(dashboard.opts) -- send config to alpha

		-- vim commands
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]]) -- disable folding on alpha buffer
	end,
}
