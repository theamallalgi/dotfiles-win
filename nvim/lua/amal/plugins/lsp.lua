return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "williamboman/mason.nvim", config = true },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "b0o/schemastore.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		require("mason").setup({
			ui = {
				-- border = "rounded",
				icons = {
					package_installed = "󰄬",
					package_pending = "󰁔",
					package_uninstalled = "󰅖",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(require("amal.plugins.lsp.servers")),
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						-- on_attach = require("plugins.lsp.on_attach").on_attach,
						settings = require("amal.plugins.lsp.servers")[server_name],
						filetypes = (require("amal.plugins.lsp.servers")[server_name] or {}).filetypes,
					})
				end,
			},
		})

		require("lspconfig").lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						},
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		vim.diagnostic.config({
			title = false,
			underline = true,
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
			},
			update_in_insert = false,
			severity_sort = true,
			float = {
				source = "if_many",
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})
	end,
}
