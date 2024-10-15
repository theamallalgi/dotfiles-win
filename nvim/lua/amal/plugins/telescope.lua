return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ▶  ",
				path_display = { "smart" },
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser") -- load file_browser extension

		-- Keybindings
		keymap.set("n", "<space><space>", "<cmd>:Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set(
			"n",
			"<Leader>o",
			"<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
			{ desc = "Fuzzy recent files in cwd" }
		)
		keymap.set("n", "<Leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<Leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy string under cursor in cwd" })
		keymap.set("n", "<Leader>b", builtin.buffers, {}) -- shows open buffers with (space-b)
		keymap.set("n", "<Leader>f", function() -- opens the file browser
			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			})
		end, { desc = "Open File Browser with the path of the current buffer" })

		require("amal.core.uiconfig") -- telescope ui settings
	end,
}
