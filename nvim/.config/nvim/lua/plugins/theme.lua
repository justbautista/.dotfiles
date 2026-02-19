local add = require("mini.deps").add

add({ source = "folke/tokyonight.nvim" })
add({ source = "catppuccin/nvim", name = "catppuccin" })

require("tokyonight").setup({
	style = "night",
})

require("catppuccin").setup({
	flavour = "mocha",
})

vim.cmd.colorscheme("tokyonight")
