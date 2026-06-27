vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").install({
	"lua",
	"markdown_inline",
	"markdown",
	"vimdoc",
	"python",
	"go",
	"javascript",
	"typescript",
	"json",
	"yaml",
	"toml",
	"terraform",
})
