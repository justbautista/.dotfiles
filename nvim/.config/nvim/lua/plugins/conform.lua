vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	python = { "ruff" },
	lua = { "stlyua" },
	typescript = { "biome" },
	javascript = { "biome" },
	json = { "biome" },
	html = { "biome" },
	css = { "biome" },
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
