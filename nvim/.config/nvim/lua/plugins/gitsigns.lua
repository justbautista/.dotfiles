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
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>gp", function()
			gitsigns.toggle_word_diff()
			gitsigns.toggle_linehl()
		end, { desc = "Toggle Gitsigns word and line diffs" })
		map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
	end,
})
