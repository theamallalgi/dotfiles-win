return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_lspconfig = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		-- Disable LSP formatting for Python to avoid conflict with Conform
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Disable formatting for Python
				if vim.bo.filetype == "python" then
					ev.client.server_capabilities.documentFormattingProvider = false
					ev.client.server_capabilities.documentRangeFormattingProvider = false
				end

				-- Set keybinds
				local opts = { buffer = ev.buf, silent = true }
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_lspconfig.default_capabilities()

		mason_lspconfig.setup({
			automatic_installation = true, -- Simplified setup
		})

		-- Add server-specific configurations here
		mason_lspconfig.setup_handlers({
			-- Default handler
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- Custom handlers for specific language servers
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					capabilities = capabilities,
				})
			end,

			["cssls"] = function()
				lspconfig["cssls"].setup({
					capabilities = capabilities,
				})
			end,

			["html"] = function()
				lspconfig["html"].setup({
					capabilities = capabilities,
				})
			end,

			["eslint"] = function()
				lspconfig["eslint"].setup({
					capabilities = capabilities,
				})
			end,

			["pyright"] = function()
				lspconfig["pyright"].setup({
					-- Disable Pyright formatting to prevent conflict with isort/black
					on_attach = function(client, bufnr)
						if client.name == "pyright" then
							client.resolved_capabilities.document_formatting = false
						end
					end,
					capabilities = capabilities,
				})
			end,

			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
					},
				})
			end,

			["gopls"] = function()
				lspconfig["gopls"].setup({
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,

			["rust_analyzer"] = function()
				lspconfig["rust_analyzer"].setup({
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,

			["bashls"] = function()
				lspconfig["bashls"].setup({
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,
		})
	end,
}
