vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	"https://github.com/L3MON4D3/LuaSnip", -- dep
	"https://github.com/github/copilot.vim", -- dep
	"https://github.com/fang2hou/blink-copilot", -- dep
})

require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<esc>"] = {
			function(cmp) -- cancel autocomplete and exit insert mode
				cmp.cancel()
				vim.schedule(function()
					vim.cmd.stopinsert()
				end)
			end,
		},
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			border = "solid",
			draw = {
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = {
				border = "solid",
			},
			treesitter_highlighting = true,
		},
	},

	cmdline = {
		keymap = {
			["<tab>"] = { "show_and_insert_or_accept_single", "accept", "fallback" },
			["<C-j>"] = { "show_and_insert_or_accept_single", "select_next" },
			["<C-k>"] = { "show_and_insert_or_accept_single", "select_prev" },
			["<esc>"] = {
				"cancel",
				"hide",
				function()
					vim.api.nvim_feedkeys(vim.keycode("<C-c>"), "n", false) -- completely exit cmdline mode, avoid third cancel buffer
					return true
				end,
			},
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			menu = {
				auto_show = false,
			},
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
				opts = {
					max_completions = 1,
				},
			},
		},
	},

	snippets = {
		preset = "luasnip",
	},

	fuzzy = {
		implementation = "lua",
	},

	signature = {
		enabled = true,
	},
})

-- Hide Copilot suggestions when blink's completion menu is open
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.b.copilot_suggestion_hidden = true
	end,
})
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})
