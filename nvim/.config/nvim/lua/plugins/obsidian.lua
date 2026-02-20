local add = require("mini.deps").add

add({ source = "obsidian-nvim/obsidian.nvim", version = vim.version.range("*") })

require("obsidian").setup({
	workspaces = {
		{
			name = "master",
			path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Master/",
		},
	},
})
