vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.ai", version = "stable" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" }, -- for treesitter integration
	{ src = "https://github.com/nvim-mini/mini.surround", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.clue", version = "main" },
})

require("mini.pairs").setup()
require("mini.surround").setup()

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
clue.setup({
	triggers = {
		{ mode = "n", keys = "<leader>" },
		{ mode = "n", keys = "g" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
	},
	window = {
		config = {
			border = "solid",
		},
		delay = 100,
	},
})
