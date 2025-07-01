-- autocmd.lua - commands and automations to run with nvim

local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- go to last loc when opening a buffer
-- this means that when you open a file, you will be at the last position
-- api.nvim_create_autocmd("BufReadPost", {
-- callback = function()
-- local mark = vim.api.nvim_buf_get_mark(0, '"')
-- local lcount = vim.api.nvim_buf_line_count(0)
-- if mark[1] > 0 and mark[1] <= lcount then
-- pcall(vim.api.nvim_win_set_cursor, 0, mark)
-- end
-- end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- enable spell checking for certain file types
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en,de"
  end,
})
