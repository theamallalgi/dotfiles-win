return {
	"neovim/nvim-lspconfig",
	event = { "bufreadpre", "bufnewfile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- disable LSP diagnostic signs/icons in the gutter
		vim.diagnostic.config({ signs = false })

		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentformattingprovider then
				vim.api.nvim_create_autocmd("bufwritepre", {
					group = vim.api.nvim_create_augroup("format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				nvim_lsp["ts_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["cssls"] = function()
				nvim_lsp["cssls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["html"] = function()
				nvim_lsp["html"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["eslint"] = function()
				nvim_lsp["eslint"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["pyright"] = function()
				nvim_lsp["pyright"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				nvim_lsp["emmet_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["gopls"] = function()
				nvim_lsp["gopls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,
			["rust_analyzer"] = function()
				nvim_lsp["rust_analyzer"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,
			["bashls"] = function()
				nvim_lsp["bashls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					diagnostics = { enable = false },
				})
			end,
		})
	end,
}
