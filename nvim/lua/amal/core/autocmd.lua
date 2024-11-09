local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- go to last loc when opening a buffer
-- this means that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Enable spell checking for certain file types
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = "en,de"
	end,
})
