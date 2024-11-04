return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree", -- Load only when `:Neotree` command is used
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
			callback = function()
				-- Open Neo-tree only if the buffer is a directory at startup
				local f = vim.fn.expand("%:p")
				if vim.fn.isdirectory(f) ~= 0 then
					vim.cmd("Neotree current dir=" .. f)
					vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
				end
			end,
		})
	end,
	opts = {
		hide_root_node = true,
		retain_hidden_root_indent = true,
		popup_border_style = "rounded",
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			hijack_netrw_behavior = "open_current",
			cwd_target = "current", -- Ensures Neo-tree always opens in the current working directory
			filtered_items = {
				hide_dotfiles = false,
				hide_by_name = { ".git", ".DS_Store" },
				always_show = { ".env" },
			},
		},
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },
	},
}
