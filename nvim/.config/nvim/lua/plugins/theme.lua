local add = require('mini.deps').add

add({ source = 'folke/tokyonight.nvim' })

require('tokyonight').setup({
    style = "night"
})

vim.cmd.colorscheme("tokyonight")

