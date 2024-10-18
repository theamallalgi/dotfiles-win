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
	opts = {},
	filesystem = {
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
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
