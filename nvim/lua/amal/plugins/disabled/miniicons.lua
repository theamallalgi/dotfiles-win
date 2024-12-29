return {
	"echasnovski/mini.icons",
	priority = 100,
	lazy = false,
	config = function()
		require("mini.icons").setup({
			lsp = {
				copilot = { glyph = "", hl = "MiniIconsRed" },
				signature = { glyph = "󰅲", hl = "MiniIconsBlue" },
				-- supermaven = { glyph = "󰌶", hl = "MiniIconsRed" },
			},
		})
		MiniIcons.mock_nvim_web_devicons()
	end,
}
