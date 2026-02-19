local add = require("mini.deps").add

add({ source = "saghen/blink.cmp", depends = { "L3MON4D3/LuaSnip" } })

require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<esc>"] = { "cancel", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets" },
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
