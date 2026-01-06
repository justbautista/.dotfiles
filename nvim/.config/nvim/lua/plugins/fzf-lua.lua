local add = require('mini.deps').add

add({ source = 'ibhagwan/fzf-lua', depends = { 'nvim-treesitter/nvim-treesitter' } })

require('fzf-lua').setup()

local fzf = require('fzf-lua')

vim.keymap.set('n', '<leader><leader>', fzf.files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = "Project-wide grep" })
vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = "Search help" })
vim.keymap.set('n', '<leader>fs', fzf.treesitter, { desc = "Search symbols" })

