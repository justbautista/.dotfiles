vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.ai", version = "stable" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" }, -- for treesitter integration
	{ src = "https://github.com/nvim-mini/mini.surround", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.clue", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.input", version = "stable" },
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.input").setup({ scope = "cursor" }) -- floating vim.ui.input near the cursor

local gen_spec = require("mini.ai").gen_spec
require("mini.ai").setup({ -- treesitter integration
	custom_textobjects = {
		-- function body, f is for function signature
		F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		-- class
		c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		-- loops, conditionals
		o = gen_spec.treesitter({
			a = { "@conditional.outer", "@loop.outer" },
			i = { "@conditional.inner", "@loop.inner" },
		}),
	},
})

local clue = require("mini.clue")

-- built-in <C-w> clues, minus the ones my own keymaps already cover
-- (window moves are <C-h/j/k/l>, resizing is <C-Up/Down> and <C-S-Up/Down>)
local covered = { h = true, j = true, k = true, l = true, ["+"] = true, ["-"] = true, ["<"] = true, [">"] = true }
local window_clues = vim.tbl_filter(function(c)
	return not covered[c.keys:sub(#"<C-w>" + 1)]
end, clue.gen_clues.windows())

clue.setup({
	triggers = {
		{ mode = { "n", "x" }, keys = "<leader>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "s" }, -- mini.surround
		{ mode = { "n", "x" }, keys = "z" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
	},
	clues = {
		{ mode = "n", keys = "<leader>f", desc = "+Find" },
		{ mode = "n", keys = "<leader>g", desc = "+Git" },
		{ mode = "n", keys = "<leader>p", desc = "+Plugins" },
		{ mode = { "n", "x" }, keys = "<leader>_", desc = "+No yank" },
		clue.gen_clues.g(),
		clue.gen_clues.square_brackets(),
		clue.gen_clues.z(),
		window_clues,
	},
	window = {
		delay = 100,
	},
})
