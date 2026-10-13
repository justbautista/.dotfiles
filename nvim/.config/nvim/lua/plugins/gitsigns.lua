vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	signs = {
		add = { text = "▒" },
		change = { text = "🮘" },
		untracked = { text = "┇" },
	},
	signs_staged = {
		add = { text = "▒" },
		change = { text = "🮘" },
		untracked = { text = "┇" },
	},
	numhl = true,
	current_line_blame = true,
})

-- global so the <leader>g clue group exists in every buffer, not only git-tracked ones
local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>gp", function()
	gitsigns.toggle_word_diff()
	gitsigns.toggle_linehl()
end, { desc = "Toggle Gitsigns word and line diffs" })
vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk, { desc = "Preview Git hunk" })
