--  ▄ •▄ ▄▄▄ . ▄· ▄▌• ▌ ▄ ·.  ▄▄▄·  ▄▄▄·.▄▄ ·
--  █▌▄▌▪▀▄.▀·▐█▪██▌·██ ▐███▪▐█ ▀█ ▐█ ▄█▐█ ▀.
--  ▐▀▀▄·▐▀▀▪▄▐█▌▐█▪▐█ ▌▐▌▐█·▄█▀▀█  ██▀·▄▀▀▀█▄
--  ▐█.█▌▐█▄▄▌ ▐█▀·.██ ██▌▐█▌▐█ ▪▐▌▐█▪·•▐█▄▪▐█
--  ·▀  ▀ ▀▀▀   ▀ • ▀▀  █▪▀▀▀ ▀  ▀ .▀    ▀▀▀▀

local set = vim.keymap.set
local silent = { remap = false, silent = true }

-- general
set("n", "<Leader>s", ":write<CR>", silent) -- saves the file with (space-s)
set("n", "Q", "<C-W>q") -- quits the window/screen with (shift+q) or (Q)
set("n", "<Leader>q", "<cmd>wq<cr>") -- saves and quits the tab with (shift+q) or (Q)
set("n", "<Leader>h", ":noh<CR>", silent) -- clears search highlights (space+h)
set("n", "<leader>/", ":normal gcc<CR><DOWN>", silent) -- comments the line with (space+/) or uncomments it
set("v", "<leader>/", ":normal gcc<CR><DOWN>", silent) -- comments the line with (space+/) or uncomments it
set("n", "<C-a>", "ggVG", silent) -- selects the entire document
set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>") -- clear search with <esc>
-- set("n", "<C-a>", "<cmd>Alpha<cr>", silent) -- opens the dashboard (alpha)
-- set("n", "zz", ":ZenMode<CR>", silent) -- neotree reveal with (ctrl+n)

-- neotree config
set("n", "<C-b>", ":Neotree position=left dir=%:p:h:h reveal_file=%:p<CR>y<CR>", silent)
set("n", "<C-n>", ":Neotree filesystem toggle<CR>", silent) -- neotree reveal with (ctrl+n)

-- split screen configs
set("n", "vv", "<C-W>v") -- vertical split with (vv)
set("n", "ss", "<C-W>s") -- horizontal split with (ss)
set("n", "C-j", "<C-w>j") -- jumps to the bottom split with (ctrl+j)
set("n", "C-k", "<C-w>k") -- jumps to the top split with (ctrl+k)
set("n", "C-h", "<C-w>h") -- jumps to the left split with (ctrl+h)
set("n", "C-l", "<C-w>l") -- jumps to the right split with (ctrl+l)

-- indentation (in visual mode)
set("v", "<Tab>", ">gv") -- tab spaces with (tab)
set("v", "<S-Tab>", "<gv") -- negative tab spaces with (shit-tab)

-- telescope keymaps
-- set("n", "<Leader>o", ":Telescope oldfiles<CR>", silent) -- shows old files in telescope (space-o)
-- set("n", "<Leader>b", ":Telescope Buffers<CR>", silent) -- change the buffers with (ctrl+tab)

-- move to window using the <ctrl> hjkl keys
set("n", "<C-h>", "<C-w>h", silent)
set("n", "<C-j>", "<C-w>j", silent)
set("n", "<C-k>", "<C-w>k", silent)
set("n", "<C-l>", "<C-w>l", silent)

-- move lines
set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- tabs and buffers
set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
set("n", "<leader>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
set("n", "<leader>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- set("n", "<Tab>", ":bnext<CR>", silent)
set("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)

-- size and stuff
set("n", "<C-Up>", "<cmd>resize -2<cr>", silent)
set("n", "<C-Down>", "<cmd>resize +2<cr>", silent)
set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", silent)
set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", silent)
