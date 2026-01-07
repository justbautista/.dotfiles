local add = require('mini.deps').add

add({
    source = 'NeogitOrg/neogit',
    depends = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'ibhagwan/fzf-lua',
    }
})

require('neogit').setup()
