local add = require("mini.deps").add

add({ source = "folke/snacks.nvim" })

require("snacks").setup({
	bigfile = { enabled = false },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	indent = { enabled = true },
	input = { enabled = false },
	picker = {
		enabled = false,
		matcher = {
			frecency = true,
			history_bonus = true,
		},
	},
	notifier = { enabled = false },
	quickfile = { enabled = false },
	scope = { enabled = false },
	scroll = { enabled = true },
	statuscolumn = { enabled = false },
	words = { enabled = false },
	lazygit = { enabled = true },
})

-- local snacks = require("snacks")
-- local map = vim.keymap.set

-- map("n", "<leader><leader>", function()
-- 	snacks.picker.smart()
-- end, { desc = "Find files" })
--
-- map("n", "<leader>fg", function()
-- 	snacks.picker.grep()
-- end, { desc = "Project-wide grep" })
--
-- map("n", "<leader>fn", function()
-- 	snacks.picker.notifications()
-- end, { desc = "Find notifications" })
