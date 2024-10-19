return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
			callback = function()
				local f = vim.fn.expand("%:p")
				if vim.fn.isdirectory(f) ~= 0 then
					vim.cmd("Neotree current dir=" .. f)
					vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
				end
			end,
		})
	end,
	opts = {
		hide_root_node = true, -- Hide the root node.
		retain_hidden_root_indent = true, -- IF the root node is hidden, keep the indentation anyhow.
		popup_border_style = "rounded",
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			hijack_netrw_behavior = "open_current",
			filtered_items = {
				hide_dotfiles = false,
				hide_by_name = {
					".git",
					".DS_Store",
				},
				always_show = {
					".env",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
