-- ▄• ▄▌▪     ▄▄·        ▐ ▄ ·▄▄▄▪   ▄▄ •
-- █▪██▌██   ▐█ ▌▪▪     •█▌▐█▐▄▄·██ ▐█ ▀ ▪
-- █▌▐█▌▐█·  ██ ▄▄ ▄█▀▄ ▐█▐▐▌██▪ ▐█·▄█ ▀█▄
-- ▐█▄█▌▐█▌  ▐███▌▐█▌.▐▌██▐█▌██▌.▐█▌▐█▄▪▐█
--  ▀▀▀ ▀▀▀  ·▀▀▀  ▀█▄▀▪▀▀ █▪▀▀▀ ▀▀▀·▀▀▀▀

local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

local purple1 = "#333352"
local purple2 = "#232338"
local purple3 = "#12121c"
local red1 = "#ba3648"
local green1 = "#37ad39"
local blue1 = "#0985de"
local blue3 = "#313244"
local black = "#1a1b26"
local white = "#edecee"
local red = "#ff6767"
local green = "#61ffca"
local blue = "#a277ff"
local magenta = "#a277ff"
local cyan = "#61ffca"
local yellow = "#ffca85"
local orange = "#ff7b7b"
local gray = "#29263c"
local darkgray = "#15141b"
local lightgray = "#433e62"
local inactivegray = "#3b4261"
local lightergray = "#776eae"
local bgred = "#652929"
local bggreen = "#123127"
local bgblue = "#2f234b"
local bgyellow = "#4b3b27"
local bgorange = "#4b2424"
local bgmagenta = "#433e62"

-- highlight on yank
vim.api.nvim_set_hl(0, "IncSearch", { bg = red, fg = black })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

-- nvim stuff
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = darkgray })
-- vim.api.nvim_set_hl(0, "CursorLineNR", { bg = darkgray, fg = lightergray })
-- vim.api.nvim_set_hl(0, "Visual", { bg = "#21202b" }) -- selection background
-- seperators
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#0f0f14", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "NONE", bg = "NONE" })

-- flash nvim setup
-- vim.api.nvim_set_hl(0, "MyFlashBackdrop", { bg = "NONE", fg = "#3d375e" }) -- backdrop
-- vim.api.nvim_set_hl(0, "MyFlashMatch", { bg = blue, fg = purple3 }) -- search matches
-- vim.api.nvim_set_hl(0, "MyFlashCurrent", { bg = yellow, fg = purple3 }) -- current match
-- vim.api.nvim_set_hl(0, "MyFlashLabel", { bg = red, fg = purple3 }) -- jump label

-- cmp
-- vim.api.nvim_set_hl(0, "cmpnormal", { bg = "#15141b", fg = "#554d84" })
-- vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#15141b", fg = "#554d84" })
-- vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#1b1a23", fg = "#a277ff", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#554d84" })
-- vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "NONE", fg = "#554d84" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "NONE", fg = "#554d84" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#7a6ebe", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#7a6ebe" })

-- telescope config
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = magenta })
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = blue, bg = gry })
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = blue, bg = bgblue, bold = true })
-- vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = inactivegray })
-- vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = magenta })
-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = magenta })
-- vim.api.nvim_set_hl(0, "TelescopeResults", { fg = magenta })
-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = magenta, bg = darkgray })
-- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = blue, bg = bgblue, bold = true })
-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = magenta })
-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = white, bg = darkgray })
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = blue, bg = bgblue, bold = true })
-- vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = green, bg = purple2 })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = blue, fg = red })
-- vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = cyan })
-- vim.api.nvim_set_hl(0, "TelescopeResults", { fg = blue })
-- vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = magenta, bg = "#21202b", bold = true })
-- vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = orange, bg = "#21202b" })

-- neo tree config
-- vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { bg = "NONE", fg = yellow })
-- vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { bg = "NONE", fg = yellow })
-- vim.api.nvim_set_hl(0, "NeoTreeFileName", { bg = "NONE", fg = blue })
-- vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "NONE", fg = blue })
-- vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#21202b" })
-- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = darkgray, fg = blue })
-- vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = darkgray, fg = magenta })
-- vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = bgblue, fg = blue })
-- vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { bg = "NONE", fg = "#4f3e29" })

-- lazy config
-- vim.api.nvim_set_hl(0, "LazyNormal", { bg = darkgray })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = magenta })
