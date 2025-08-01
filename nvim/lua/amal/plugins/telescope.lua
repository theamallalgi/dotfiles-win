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
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		-- Custom formatter for file entries
		local function formattedName(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
      return string.format("%-30s  %s", tail, parent) -- fixed-width file name
		end

		telescope.setup({
			defaults = {
				color_devicons = false,
				shorten_path = true,
				prompt_prefix = "   ",
        entry_prefix = "    ",
				selection_caret = " ▶  ",
				path_display = { "smart" },
				layout_strategy = "vertical",
				layout_config = { preview_cutoff = 0 },
				cache_picker = {
					num_pickers = 10,
				},
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<Down>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Up>"] = "move_selection_previous",
						["<CR>"] = "select_default",
						["<C-y>"] = "select_default",
					},
					n = {
						["<C-j>"] = "move_selection_next",
						["<Down>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Up>"] = "move_selection_previous",
						["<CR>"] = "select_default",
						["<C-y>"] = "select_default",
					},
				},
				-- ⬇ Add custom entry maker
				entry_maker = function(entry)
					local make_entry = require("telescope.make_entry")
					local item = make_entry.gen_from_file()(entry)
					item.display = formattedName(nil, item.value)
					return item
				end,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Autocmd to highlight parent path
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
				end)
			end,
		})

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
		keymap.set("n", "<Leader>b", builtin.buffers, {})

		keymap.set("n", "<Leader>f", function()
			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end
			load_extension("file_browser")
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

		vim.defer_fn(function()
			require("amal.core.uiconfig")
		end, 100)
	end,
}
