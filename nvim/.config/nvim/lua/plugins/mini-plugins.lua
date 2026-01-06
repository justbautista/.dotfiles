require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.statusline').setup()

require('mini.notify').setup()
vim.keymap.set('n', '<leader>n', MiniNotify.show_history, { desc = 'Show notification history' })

-- extends a/i text objects (like iw or a")
-- adds text objects like f so you can select a function with vaf
require('mini.ai').setup()

-- animations like smooth scroll
require('mini.animate').setup({
    cursor = {
        enable = false,
    },
    resize = {
        enable = false,
    },
    open = {
        enable = false,
    },
    close = {
        enable = false,
    }
}) 

