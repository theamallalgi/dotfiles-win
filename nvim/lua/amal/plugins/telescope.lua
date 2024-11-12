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
				color_devicons = false,
				entry_prefix = " ",
				shorten_path = true,
				prompt_prefix = "   ",
				selection_caret = " ▶  ",
				path_display = { "smart" },

				-- Load sorting strategy for faster performance
				-- sorting_strategy = "ascending",
				layout_strategy = "vertical", -- Faster in some cases than the default
				cache_picker = {
					num_pickers = 10, -- Limit the cache for faster repeated access
				},
			},
		})

		-- Lazy-load extensions only when needed
		local load_extension = function(name)
			pcall(telescope.load_extension, name)
		end
		load_extension("fzf")
		load_extension("file_browser")

		-- Keybindings
		keymap.set("n", "<space><space>", "<cmd>:Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<space>tn", "<cmd>:Telescope noice<CR>", { desc = "Find noice previous messages" })
		keymap.set("n", "<space>cc", "<cmd>:Telescope colorscheme<CR>", { desc = "Browse colorschemes" })
		keymap.set("n", "<Leader>o", function()
			builtin.oldfiles(require("telescope.themes").get_dropdown({ previewer = false }))
		end, { desc = "Recent files in cwd" })
		keymap.set("n", "<Leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<Leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "String under cursor in cwd" })
		keymap.set("n", "<Leader>b", builtin.buffers, {}) -- Shows open buffers with (space-b)

		keymap.set("n", "<Leader>f", function()
			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end
			load_extension("file_browser") -- Lazy-load file_browser extension only here

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

		-- Import only if necessary, to delay load
		vim.defer_fn(function()
			require("amal.core.uiconfig")
		end, 100) -- Slight delay to load UI settings
	end,
}
