vim.g.mapleader = " "
vim.g.localleader = " "

require("configs.options")
require("configs.keymaps")
require("configs.autocmds")

local pack = require("utils.pack")
local plugins_dir = "plugins"
local plugins = {
	"themes",
	"icons",
	"fidget",
	"oil",
	"treesitter",
	"fzf-lua",
	"mini",
	"gitsigns",
	"lualine",
	"lsp",
	"blink-cmp",
	"conform",
	"grug-far",
	"diffview",
    "render-md",
}
pack.add(plugins, plugins_dir)
pack.set_keymaps()
