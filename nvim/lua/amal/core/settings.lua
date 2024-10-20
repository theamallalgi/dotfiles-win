--   ▄▄ • ▄▄▄ . ▐ ▄ ▄▄▄ .▄▄▄   ▄▄▄· ▄▄▌
--  ▐█ ▀ ▪▀▄.▀·•█▌▐█▀▄.▀·▀▄ █·▐█ ▀█ ██•
--  ▄█ ▀█▄▐▀▀▪▄▐█▐▐▌▐▀▀▪▄▐▀▀▄ ▄█▀▀█ ██▪
--  ▐█▄▪▐█▐█▄▄▌██▐█▌▐█▄▄▌▐█•█▌▐█ ▪▐▌▐█▌▐▌
--  ·▀▀▀▀  ▀▀▀ ▀▀ █▪ ▀▀▀ .▀  ▀ ▀  ▀ .▀▀▀
--  .▄▄ · ▄▄▄ .▄▄▄▄▄▄▄▄▄▄▪   ▐ ▄  ▄▄ • .▄▄ ·
--  ▐█ ▀. ▀▄.▀·•██  •██  ██ •█▌▐█▐█ ▀ ▪▐█ ▀.
--  ▄▀▀▀█▄▐▀▀▪▄ ▐█.▪ ▐█.▪▐█·▐█▐▐▌▄█ ▀█▄▄▀▀▀█▄
--  ▐█▄▪▐█▐█▄▄▌ ▐█▌· ▐█▌·▐█▌██▐█▌▐█▄▪▐█▐█▄▪▐█
--   ▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀ ▀▀▀▀▀ █▪·▀▀▀▀  ▀▀▀▀

-- indentation config
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- clipboard
vim.cmd("set clipboard+=unnamedplus")
-- vim.cmd("set paste")

-- status bar
vim.cmd("set noshowmode")
vim.cmd("set conceallevel=0")
vim.cmd("set cmdheight=0")

-- split screen config (only splits to right and bottom sides)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- netrw config
vim.g.netrw_banner = 0 -- disable the how tos and stuff from netrw window
vim.g.netrw_mouse = 2 -- mouse config for netrw
-- vim.cmd("let g:netrw_liststyle = 3") -- sets the default file explorer style to tree structure

-- Misc Config
vim.o.guifont = "JetbrainsMono Nerd Font:h11" -- sets the default font and height
vim.g.mapleader = " " -- maps the leader key
vim.g.maplocalleader = "\\" -- local leader key config
vim.opt.autoread = true -- updates vim after file update outside
vim.cmd("set number") -- sets line numbers
vim.cmd("set relativenumber") -- sets relative line numbers
vim.cmd("set nowrap") -- turns off word wrap
vim.cmd("set fileformat=unix") -- turns file format to unix style
vim.opt.showmode = false -- disables the ~ symbol (end of buffer indicator)
vim.o.termguicolors = true -- sets proper terminal colors
vim.o.completeopt = "menuone,noselect" -- have a better completion experience
vim.opt.cursorline = true -- sets the cursor line

-- theme related config
-- vim.g.nord_disable_background = true

-- Neovide Config
if vim.g.neovide then
	vim.g.neovide_hide_mouse_when_typing = false -- hides the mouse cursor when typing
	vim.g.neovide_cursor_animate_command_line = false -- disables cursor animation on cmd mode
	-- colorscheme tokyonight-night -- colorscheme for neovide
end
