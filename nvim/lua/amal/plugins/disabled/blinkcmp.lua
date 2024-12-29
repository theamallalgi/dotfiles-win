return {
	"saghen/blink.cmp",
	lazy = false,
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local blink = require("blink.cmp")
		local is_open = function()
			local autocomplete = require("blink.cmp.windows.autocomplete")
			return autocomplete.win:is_open()
		end
		local if_open = function(fn_name)
			return function(cmp)
				if is_open() then
					return cmp[fn_name]()
				end
			end
		end
		blink.setup({
			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- nerd_font_variant = "mono",

			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			trigger = {
				completion = {
					show_in_snippet = false,
				},
				signature_help = {
					enabled = true,
				},
			},

			windows = {
				autocomplete = {
					enabled = true,
					auto_show = false,
					draw = {
						-- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
				},
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 0,
				},
				ghost_text = {
					enabled = true,
				},
			},

			-- 'default' | 'super-tab'
			keymap = {
				["<c-space>"] = { "show", "hide" },
				["<m-n>"] = { "show", "hide" },
				["<m-d>"] = {
					if_open("show_documentation"),
					if_open("hide_documentation"),
					"fallback",
				},
				["<cr>"] = {
					if_open("select_and_accept"),
					"fallback",
				},
				["<s-cr>"] = {
					if_open("accept"),
					"fallback",
				},
				["<tab>"] = {
					function(cmp)
						if cmp.is_in_snippet() then
							return cmp.snippet_forward()
						else
							if is_open() then
								return cmp.select_and_accept()
							end
						end
					end,
					"fallback",
				},
				["<s-tab>"] = {
					function(cmp)
						if cmp.is_in_snippet() then
							return cmp.snippet_forward()
						end
					end,
					"fallback",
				},
				["<up>"] = {
					if_open("select_prev"),
					"fallback",
				},
				["<down>"] = {
					if_open("select_next"),
					"fallback",
				},
				["<m-b>"] = {
					if_open("scroll_documentation_up"),
					"fallback",
				},
				["<m-f>"] = {
					if_open("scroll_documentation_down"),
					"fallback",
				},
			},
		})

		vim.schedule(function()
			local autocomplete = require("blink.cmp.windows.autocomplete")
			autocomplete.listen_on_open(function()
				if not autocomplete.auto_show then
					return
				end
				require("copilot.suggestion").dismiss()
				vim.api.nvim_buf_set_var(0, "copilot_suggestion_hidden", true)
			end)

			autocomplete.listen_on_close(function()
				vim.api.nvim_buf_set_var(0, "copilot_suggestion_hidden", false)
			end)
		end)
	end,
}
