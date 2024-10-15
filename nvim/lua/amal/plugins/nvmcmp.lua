return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		-- custom colors
		vim.api.nvim_set_hl(0, "cmpnormal", { bg = "#15141b", fg = "#554d84" })
		vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#15141b", fg = "#554d84" })
		vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#1b1a23", fg = "#a277ff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#554d84" })
		vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "NONE", fg = "#554d84" })
		vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "NONE", fg = "#554d84" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#7a6ebe", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#7a6ebe" })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpCursorLine,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpCursorLine,Search:None",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
	end,
}
