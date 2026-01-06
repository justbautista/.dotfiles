local add = require('mini.deps').add

add({ source = 'lewis6991/gitsigns.nvim' })

require('gitsigns').setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        changedelete = { text = '*' },
    },
    signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        changedelete = { text = '*' },
    },
    numhl = true,
    current_line_blame = true,
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gh', function()
            gitsigns.toggle_word_diff()
            gitsigns.toggle_linehl()
        end, { desc = 'Toggle Gitsigns word and line diff highlights' })
    end,
})


