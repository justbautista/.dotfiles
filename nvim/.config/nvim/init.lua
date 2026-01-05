-- order matters
-- set leader globally first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- bootstrap mini.deps, set options as plugins may rely on them, then load plugins
require("config.mini")
require("config.options")
require("plugins")

-- set general keymaps and autocmds
require("config.keymaps")
require("config.autocmds")

