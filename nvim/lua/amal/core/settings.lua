-- settings.lua

local vim = vim

-- indentation config
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- tabline setup
vim.opt.showtabline = 0

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
vim.g.netrw_mouse = 2  -- mouse config for netrw
-- vim.cmd("let g:netrw_liststyle = 3") -- sets the default file explorer style to tree structure

-- misc config
vim.o.guifont = "JetBrainsMono Nerd Font:h11" -- sets the default font and height
vim.g.mapleader = " "                         -- maps the leader key
vim.g.maplocalleader = "\\"                   -- local leader key config
vim.opt.autoread = true                       -- updates vim after file update outside
-- vim.opt.statuscolumn = "%s %l %r " -- relative line numbers
vim.cmd("set number")                         -- sets line numbers
vim.cmd("set relativenumber")                 -- sets relative line numbers
vim.cmd("set nowrap")                         -- turns off word wrap
vim.cmd("set fileformat=unix")                -- turns file format to unix style
vim.opt.showmode = false                      -- disables the ~ symbol (end of buffer indicator)
vim.o.termguicolors = true                    -- sets proper terminal colors
vim.o.completeopt = "menuone,noselect"        -- have a better completion experience
vim.opt.cursorline = true                     -- sets the cursor line
vim.opt.ignorecase = true                     -- ignore case in search patterns
vim.opt.numberwidth = 4                       -- set number column width to 2 {default 4}
vim.opt.sidescrolloff = 8                     -- Makes sure there are always eight lines of context
vim.opt.fillchars = { eob = " " }             -- change the character at the end of buffer

-- theme related config
-- vim.g.nord_disable_background = true

-- timeout and update config
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 100  -- faster completion (4000ms default)

-- terminal config
vim.cmd([[let &shell = '"C:/Program Files/Git/bin/bash.exe"']])
vim.cmd([[let &shellcmdflag = '-s']])
