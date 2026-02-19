local add = require("mini.deps").add

add({
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})

require("nvim-treesitter.config").setup({
	auto_install = true,
	ensure_installed = {
		"lua",
		"python",
		"go",
		"rust",
		"javascript",
		"typescript",
		"regex",
		"html",
		"css",
		"markdown",
		"vim",
	},
})
