vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	"https://github.com/L3MON4D3/LuaSnip", -- dep
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
			draw = {
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
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
		default = { "lsp", "path", "snippets", "buffer" },
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
